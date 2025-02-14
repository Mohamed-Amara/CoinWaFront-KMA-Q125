import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part2.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

void onWrongAnswer(BuildContext context, int level) {
  Provider.of<LivesProvider>(context, listen: false).loseLife(context);
  if (Provider.of<ProgressProvider>(context, listen: false).level == level) {
    Provider.of<ProgressProvider>(context, listen: false)
        .addIncorrectQuestion(context);
  }
  showLifeLossAnimation(context);
}

Widget purpleTextBubbleYellow(String description) {
  List<TextSpan> textSpans = [];
  List<String> words = description.split(' ');

  for (int i = 0; i < words.length; i++) {
    textSpans.add(
      TextSpan(
        text: '${words[i]} ',
        style: TextStyle(
          color: i < 5 ? const Color(0xfff5be4e) : Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xff7870de),
    ),
    width: 200,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: textSpans,
          ),
        ),
      ),
    ),
  );
}

class Coin9QuizTemplate extends StatefulWidget {
  final List<String> option1;
  final List<String> option2;
  final String question;
  final bool isOption1Correct;
  final bool isRepeat;
  final Widget route;

  const Coin9QuizTemplate(
      {super.key,
      required this.option1,
      required this.option2,
      required this.question,
      required this.isOption1Correct, required this.isRepeat, required this.route});

  @override
  _Coin9QuizTemplateState createState() => _Coin9QuizTemplateState();
}

class _Coin9QuizTemplateState extends State<Coin9QuizTemplate> {
  bool isCorrect = false;
  bool isVisible = false;

  void _checkAnswer(bool isSelectedOption1) {
    setState(() {
      isVisible = true;
      isCorrect = isSelectedOption1 == widget.isOption1Correct;
      if (!isCorrect && !widget.isRepeat){
        onWrongAnswer(context, 9);
      }
    });
  }

  void _navigateToNextPage(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context, listen: false);

    if (progressProvider.level == 9) {
      if (progressProvider.sublevel == 7) {
        progressProvider.setSublevel(context, 8);
      } else if (progressProvider.sublevel == 8) {
        progressProvider.setSublevel(context, 9);
      } else if (progressProvider.sublevel == 9) {
        // If sublevel is already 9, navigate to the next route
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.route),
        );
        return;
      }
    }

    // If it's a repeat quiz, navigate to the next question
    if (widget.isRepeat) {
      navigateToNextQuestion(context, 9, "Net Worth");
    } else {
      // Otherwise, navigate to the specified route
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.route),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/wawaConfused.png', width: 100),
                        const SizedBox(width: 20),
                        purpleTextBubbleYellow(widget.question),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 200,
                      ),
                      child: Container(
                        color: const Color(0xffeae9ff),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text('Tap on a name tag',
                                style: TextStyle(
                                  color: Color(0xff5e17eb),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _checkAnswer(true);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      color: Color(0xff5e17eb),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            (MediaQuery.of(context).size.width <= 400)?
                                            Container(
                                              width: 180,
                                              child: Text(
                                                widget.option1[0],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            ): 
                                            Text(
                                                widget.option1[0],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            const SizedBox(width: 10),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset('assets/Unit 2/namecard.png', width: 120),
                                                Positioned(
                                                  bottom: 20,
                                                  child: Text(
                                                    widget.option1[1],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Marker',
                                                        fontSize: 24),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text('OR',
                                style: TextStyle(
                                  color: Color(0xff5e17eb),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _checkAnswer(false);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      color: Color(0xff5e17eb),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                           vertical: 25),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset('assets/Unit 2/namecard.png', width: 120),
                                              Positioned(
                                                bottom: 20,
                                                child: Text(
                                                  widget.option2[1],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Marker',
                                                      fontSize: 24),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          (MediaQuery.of(context).size.width <= 400)?
                                          Container(
                                            width: 180,
                                            child: Text(
                                              widget.option2[0],
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ): 
                                          Text(
                                              widget.option2[0],
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Visibility(
                              visible: isVisible,
                              child: isCorrect
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Correct!",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 10),
                                        ElevatedButton(
                                          onPressed: () {
                                            _navigateToNextPage(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.green[800], backgroundColor: const Color.fromARGB(255, 177, 255, 180),
                                          ),
                                          child: const Text("Continue"),
                                        ),
                                      ],
                                    )
                                  : const Text(
                                      "Incorrect!",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ExitButton(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TopBar(
                          currentPage: 7,
                          totalPages: 9,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}