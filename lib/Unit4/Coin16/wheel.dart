import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import './summary.dart';

class QuizWheelPage extends StatefulWidget {
  const QuizWheelPage({super.key});

  @override
  State<QuizWheelPage> createState() => _QuizWheelPageState();
}

class _QuizWheelPageState extends State<QuizWheelPage>
    with SingleTickerProviderStateMixin {
  StreamController<int> controller = StreamController<int>();

  int correctAnswers = 0;
  bool canSubmit = false;

  Map<int, Map<String, dynamic>> questions = {
    0: {
      'question': 'What is the capital of France?',
      'options': ['London', 'Paris', 'Berlin', 'Madrid'],
      'answer': 'Paris',
      'color': Colors.red,
    },
    1: {
      'question': 'What is 5 + 3?',
      'options': ['5', '8', '10', '12'],
      'answer': '8',
      'color': Colors.orange,
    },
    2: {
      'question': 'What planet is known as the Red Planet?',
      'options': ['Earth', 'Mars', 'Jupiter', 'Venus'],
      'answer': 'Mars',
      'color': Colors.green,
    },
    3: {
      'question': 'Who wrote "Romeo and Juliet"?',
      'options': ['Shakespeare', 'Dickens', 'Hemingway', 'Twain'],
      'answer': 'Shakespeare',
      'color': Colors.purple,
    },
    4: {
      'question': 'What is the largest ocean on Earth?',
      'options': ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
      'answer': 'Pacific',
      'color': Colors.blue,
    },
    5: {
      'question': 'What is the square root of 64?',
      'options': ['6', '7', '8', '9'],
      'answer': '8',
      'color': Colors.grey,
    },
    6: {
      'question': 'Which element has the symbol "O"?',
      'options': ['Oxygen', 'Gold', 'Iron', 'Hydrogen'],
      'answer': 'Oxygen',
      'color': Colors.red,
    },
    7: {
      'question': 'What year did WW2 end?',
      'options': ['1939', '1945', '1941', '1947'],
      'answer': '1945',
      'color': Colors.orange,
    },
    8: {
      'question': 'What is the chemical formula of water?',
      'options': ['H2O', 'CO2', 'NaCl', 'O2'],
      'answer': 'H2O',
      'color': Colors.green,
    },
    9: {
      'question': 'What is the hardest natural substance?',
      'options': ['Gold', 'Diamond', 'Iron', 'Quartz'],
      'answer': 'Diamond',
      'color': Colors.purple,
    },
  };



  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
  void spinWheel() {
    final random = Random();
    int outcome = random.nextInt(questions.length);
    controller.add(outcome);
    Future.delayed(const Duration(seconds: 5), () {
      _showPopup(outcome);
    });
  }

  void _showPopup(int outcome) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7), // Transparent black background
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff), // Purple background
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Question ${outcome+1}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  questions[outcome]?["question"], // Use the description parameter
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/wawaConfused.png',
                  width: (MediaQuery.of(context).size.width * 0.25).clamp(0, 150),
                ),
                const SizedBox(height: 20),
                Column(
                  children: questions[outcome]?["options"]
                      .expand<Widget>((option) => [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          checkAnswer(outcome, option);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2f008d),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white, // White text color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // ✅ Add spacing after each button
                  ]).toList() ?? [],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void checkAnswer(int questionKey, String selectedAnswer) {
  Map<String, dynamic> question = questions[questionKey]!;
  if (selectedAnswer == question['answer']) {
    setState(() {
      correctAnswers++;
      questions.remove(questionKey);
      //   //this line
        questions = Map.fromEntries(
          questions.entries.map((entry) {
            int newKey = entry.key > questionKey ? entry.key - 1 : entry.key;
            return MapEntry(newKey, entry.value);
          }),
        );
      });
      if (correctAnswers >= 3) {
        setState(() {
          canSubmit = true;
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct! ✅')),
      );

  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Wrong! ❌')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 15,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 91, 24, 233),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 140, 82, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Lets Test Your Knowledge",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Source",
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.width * 0.15), // 10% of screen width for padding
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 140, 82, 255),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1, // 10% of screen width
                  vertical: MediaQuery.of(context).size.height * 0.02, // 2% of screen height for vertical padding
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "SPIN THE WHEEL!!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.2), // ✅ Added spacing below the header

            // Fortune Wheel section
            GestureDetector(
              onTap: spinWheel,
              onVerticalDragEnd: (_) => spinWheel(), // ✅ Spin when swiped
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.9,
                child: FortuneWheel(
                      selected: controller.stream,
                      animateFirst: false,
                      hapticImpact: HapticImpact.medium,
                      indicators: [
                        FortuneIndicator(
                          alignment: Alignment.topCenter,
                          child: TriangleIndicator(
                            color: Colors.black,
                            width: 30.0,
                            height: 40.0,
                            elevation: 10,
                          ),
                        ),
                      ],
                    items: [
                      for (int i = 0; i < questions.length; i++)
                        if (questions.containsKey(i)) // ✅ Check if the key exists
                          FortuneItem(
                            child: Text("Q${i + 1}"),
                            style: FortuneItemStyle(
                              color: questions[i]?['color'] ?? Colors.transparent, // ✅ Use fallback color if null
                              borderColor: Colors.black,
                              borderWidth: 2.0,
                            ),
                          ),
                    ],

                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.15),
            canSubmit
                ? SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SummaryPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2f008d),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // White text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
                : const SizedBox(), // ✅ Use SizedBox() to hide it when canSubmit is false
          ],
        ),
      ),
    );
  }
}