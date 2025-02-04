import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-quiz2.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin8Quiz1 extends StatefulWidget {
  final bool isRepeat;
  const Coin8Quiz1({super.key, required this.isRepeat});

  @override
  State<Coin8Quiz1> createState() => _Coin8Quiz1State();
}

class _Coin8Quiz1State extends State<Coin8Quiz1> {
  Color background = const Color(0xfffff1db);
  String feedbackMessage = '';
  Color feedbackColor = Colors.black;
  bool showContinue = false;

  Widget option(String description, bool isCorrect) {
    return GestureDetector(
      onTap: () {
        if (!isCorrect && !widget.isRepeat) {
          _onWrongAnswer(context);
        }
        setState(() {
          background = isCorrect
              ? const Color.fromARGB(255, 177, 248, 130)
              : const Color.fromARGB(255, 247, 204, 201);
          feedbackMessage = isCorrect ? 'Correct!' : 'Incorrect!';
          feedbackColor = isCorrect
              ? const Color.fromARGB(255, 70, 129, 65)
              : const Color.fromARGB(255, 175, 33, 23);
          showContinue = isCorrect ? true : false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Container(
          width: min(MediaQuery.of(context).size.width, 600),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // Shadow color
                offset: const Offset(0, 2), // Shadow offset
                blurRadius: 4, // Shadow blur radius
              ),
            ],
            color: const Color(0xff7870de),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 10,
                      totalPages: 11,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(child: ExitButton()),
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: 350,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SpeechBubble(
                                "Now, what is a liability?", true)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/wawaConfused.png', width: 100)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: background,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              const SizedBox(height: 20),
                              option("Something someone gives you to keep", false),
                              option("Something you owe someone", true),
                              option("Something you own yourself", false),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                feedbackMessage,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: feedbackColor,
                                ),
                              ),
                              Visibility(
                                visible: showContinue,
                                child: GestureDetector(
                                  onTap: () {
                                    if (Provider.of<ProgressProvider>(context,
                                                listen: false)
                                            .sublevel ==
                                        10) {
                                      Provider.of<ProgressProvider>(context,
                                              listen: false)
                                          .setSublevel(context,11);
                                    }
                                    if (widget.isRepeat) {
                                      navigateToNextQuestion(
                                          context, 8, "What are Liabilities?");
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Coin8Quiz2(isRepeat: false),
                                        ),
                                      );
                                    }
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/big green.png', // Path to the correct image asset
                                        height:
                                            70, // Adjust the height to make the image larger
                                        fit: BoxFit.contain,
                                      ),
                                      const Center(
                                        child: Text(
                                          'Continue',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white, // Text color
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 8) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }
}
