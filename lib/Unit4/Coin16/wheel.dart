import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../../Templates/typing_text.dart';
import './summary.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:provider/provider.dart';
import '../../Templates/animation_util.dart';

class QuizWheelPage extends StatefulWidget {
  const QuizWheelPage({super.key});

  @override
  State<QuizWheelPage> createState() => _QuizWheelPageState();
}

class _QuizWheelPageState extends State<QuizWheelPage>
    with SingleTickerProviderStateMixin {
  StreamController<int> controller = StreamController<int>();

  int correctAnswers = 0;
  bool clicked = false;
  bool canSubmit = false;

  Map<int, Map<String, dynamic>> questions = {
    0: {
      'question': 'What type of tax is taken directly from your paycheck?',
      'options': ['Income Tax', 'Sales Tax', 'Corporate Tax', 'Property Tax'],
      'answer': 'Income Tax',
      'color': Colors.red,
    },
    1: {
      'question': 'Which tax is added when you buy clothes or electronics?',
      'options': ['Income Tax', 'Sales Tax', 'Corporate Tax', 'Tariffs'],
      'answer': 'Sales Tax',
      'color': Colors.orange,
    },
    2: {
      'question': 'What tax do businesses pay on their profits?',
      'options': ['Property Tax', 'Sales Tax', 'Corporate Tax', 'Tariffs'],
      'answer': 'Corporate Tax',
      'color': Colors.green,
    },
    3: {
      'question':
          'Which type of tax is paid yearly by homeowners based on the value of their property?',
      'options': ['Sales Tax', 'Property Tax', 'Corporate Tax', 'Tariffs'],
      'answer': 'Property Tax',
      'color': Colors.purple,
    },
    4: {
      'question':
          'What tax is placed on imported goods to protect local businesses?',
      'options': ['Income Tax', 'Sales Tax', 'Corporate Tax', 'Tariffs'],
      'answer': 'Tariffs',
      'color': Colors.blue,
    },
    5: {
      'question':
          'Which category receives the largest share of tax money in Canada?',
      'options': ['Education', 'Healthcare', 'Government', 'Public Safety'],
      'answer': 'Healthcare',
      'color': Colors.grey,
    },
    6: {
      'question': 'Which of these is an example of tax-funded infrastructure?',
      'options': [
        'Highways and bridges',
        'Private businesses',
        'Video game companies',
        'Luxury resorts'
      ],
      'answer': 'Highways and bridges',
      'color': Colors.red,
    },
    7: {
      'question': 'What type of tax helps fund police and firefighters?',
      'options': [
        'Sales Tax',
        'Income Tax',
        'Public Safety Tax',
        'Corporate Tax'
      ],
      'answer': 'Income Tax',
      'color': Colors.orange,
    },
    8: {
      'question': 'Which tax is often charged at checkout when you buy things?',
      'options': ['Income Tax', 'Corporate Tax', 'Sales Tax', 'Property Tax'],
      'answer': 'Sales Tax',
      'color': Colors.green,
    },
    9: {
      'question': 'What is one purpose of tariffs?',
      'options': [
        'To protect local businesses',
        'To reduce government spending',
        'To lower taxes',
        'To fund schools'
      ],
      'answer': 'To protect local businesses',
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
      barrierColor:
          Colors.black.withOpacity(0.7), // Transparent black background
      barrierDismissible: false,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Question ${outcome + 1}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    questions[outcome]?["question"] ??
                        "", // Use the description parameter
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/wawaConfused.png',
                  width:
                      (MediaQuery.of(context).size.width * 0.25).clamp(0, 150),
                ),
                const SizedBox(height: 20),
                Column(
                  children: questions[outcome]?["options"]
                          .expand<Widget>((option) => [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        checkAnswer(outcome, option);
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff2f008d),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                      ),
                                      child: Text(
                                        option,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color:
                                              Colors.white, // White text color
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ])
                          .toList() ??
                      [],
                ),
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
      _onWrongAnswer(context);
    }
    if (correctAnswers < 3) {
      setState(() {
        clicked = false;
      });
    }
  }

  void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 16) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }

  void _clickMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🏷️ Title
                Text(
                  "Error",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // 📝 Description
                Text(
                  correctAnswers < 3
                      ? "Please wait before clicking"
                      : "Please hit continue",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // 🏢 Right Image
                Image.asset(
                  "assets/yellingwawa.png", // Added correct file extension
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                // ✅ Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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

                SizedBox(
                    height: MediaQuery.of(context).size.width *
                        0.15), // 10% of screen width for padding
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 140, 82, 255),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width *
                          0.06, // 10% of screen width
                      vertical: MediaQuery.of(context).size.height *
                          0.02, // 2% of screen height for vertical padding
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "CLICK TO SPIN THE WHEEL!!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.width *
                        0.1), // ✅ Added spacing below the header

                // Fortune Wheel section
                SizedBox(
                  height: MediaQuery.of(context).size.width *
                      1.1, // Extra height for stand
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom:
                            -40, // Increase this to move the stand further down
                        child: Image.asset(
                          'assets/wheelstand.png', // Replace with your actual image path
                          width: MediaQuery.of(context).size.width *
                              0.5, // Adjust width as needed
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!clicked) {
                            setState(() {
                              clicked = true;
                            });
                            spinWheel();
                          } else {
                            _clickMessage();
                          }
                        },
                        onVerticalDragEnd: (_) {
                          if (!clicked) {
                            clicked = true;
                            spinWheel();
                          } else {
                            _clickMessage();
                          }
                        },
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
                                if (questions.containsKey(i))
                                  FortuneItem(
                                    child: Text("Q${i + 1}"),
                                    style: FortuneItemStyle(
                                      color: questions[i]?['color'] ??
                                          Colors.transparent,
                                      borderColor: Colors.black,
                                      borderWidth: 2.0,
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                canSubmit
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SummaryPage()),
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
                                fontSize: 20,
                                color: Colors.white, // White text color
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Source'),
                          ),
                        ),
                      )
                    : const SizedBox(), // ✅ Use SizedBox() to hide it when canSubmit is false
              ],
            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 5,
                      totalPages: 6,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
