import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import './summary.dart';
import 'package:provider/provider.dart';
import '../../Providers/lives_provider.dart';
import '../../Providers/progress_provider.dart';
import '../../Templates/animation_util.dart';
import '../../Templates/Image-and-speech.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int correctAnswers = 0;
  bool canSubmit = false;

  Map<int, Map<String, dynamic>> questions = {
    0: {
      'question': 'Yap',
      'options': ['Yap', 'Yappppy', 'yapppyp', 'asiojaosiudoaudsu'],
      'answer': 'Yap',
      'color': Colors.indigo,
    },
    1: {
      'question': 'Yap',
      'options': ['Yap', 'Yappppy', 'yapppyp', 'asiojaosiudoaudsu'],
      'answer': 'Yap',
      'color': const Color.fromARGB(255, 45, 59, 139),
    },
    2: {
      'question': 'Yap',
      'options': ['Yap', 'Yappppy', 'yapppyp', 'asiojaosiudoaudsu'],
      'answer': 'Yap',
      'color': const Color.fromARGB(255, 79, 99, 214),
    },
  };

  void _showPopup(int outcome) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
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
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    questions[outcome]?["question"] ??
                        "", // Make sure there's no null
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: questions[outcome]?["options"]
                      .map<Widget>((option) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: SizedBox(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 12),
                        ),
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ))
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
        questions.remove(questionKey); // Remove the answered question
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
  }

  void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 16) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
          child: Stack(children: [
            Column(
              children: [
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
                SizedBox(height: 50),
                SpeechBubble(
                    'Time to test what you learned! Click on a question to have a go!',
                    false,
                    speechColor: Color(0xff7870DE) ,
                    triImage: "assets/trianglecut2.png",
                    speed: Duration(milliseconds: 2000),
                    textSize: 25,
                ),
                const SizedBox(height: 20),
                Image.asset('assets/wawaconfused.png',
                    height: 125, fit: BoxFit.contain),
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                // Question Boxes Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton(
                            onPressed: () => _showPopup(index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              questions[index]?['color'] ?? Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              'Question ${index + 1}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
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
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                    : const SizedBox(),
              ],
            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 13,
                      totalPages: 13,
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
