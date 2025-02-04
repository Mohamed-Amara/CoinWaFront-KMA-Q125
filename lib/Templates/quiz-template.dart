import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class QuizPageTemplate extends StatefulWidget {
  final String question;
  final List<QuizOption> options;
  final int currentPage;
  final int totalPages;
  final int level;
  final bool isRepeat;
  final VoidCallback onNextPage;

  const QuizPageTemplate({
    Key? key,
    required this.question,
    required this.options,
    required this.currentPage,
    required this.totalPages,
    required this.isRepeat,
    required this.onNextPage,
    required this.level,
  }) : super(key: key);

  @override
  State<QuizPageTemplate> createState() => _QuizPageTemplateState();
}

class _QuizPageTemplateState extends State<QuizPageTemplate> {
  // Move these variables to the class level
  Color background = const Color(0xfffff1db);
  String feedbackMessage = '';
  Color feedbackColor = Colors.black;
  bool showContinue = false;

  void handleOptionSelected(bool isCorrect) {
    setState(() {
      background = isCorrect
          ? const Color.fromARGB(255, 177, 248, 130)
          : const Color.fromARGB(255, 247, 204, 201);

      feedbackMessage = isCorrect ? 'Correct!' : 'Incorrect!';
      feedbackColor = isCorrect
          ? const Color.fromARGB(255, 70, 129, 65)
          : const Color.fromARGB(255, 175, 33, 23);

      showContinue = isCorrect ? true: false; // Always show continue button after selecting an option
    });

    if (!isCorrect && !widget.isRepeat) {
      onWrongAnswer(context, widget.level);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),  // Use the background variable here
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: widget.currentPage,
                      totalPages: widget.totalPages,
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
                            SpeechBubble(widget.question, true)
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
                    color: background,  // Use the background variable here as well
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.options.length,
                            itemBuilder: (context, index) {
                              final option = widget.options[index];
                              return GestureDetector(
                                onTap: () => handleOptionSelected(option.isCorrect),
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
                                          option.description,
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
                            },
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
                                  onTap: widget.onNextPage,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/big green.png', // Path to the correct image asset
                                        height: 70, // Adjust the height to make the image larger
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

  
}

class QuizOption {
  final String description;
  final bool isCorrect;

  QuizOption({required this.description, required this.isCorrect});
}
