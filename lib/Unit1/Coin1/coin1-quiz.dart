import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';
import '../../Providers/coin_provider.dart';

void main() {
  runApp(const Coin1Quiz(isRepeat: false,));
}

class Coin1Quiz extends StatelessWidget {
  final bool isRepeat;
  const Coin1Quiz({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(isRepeat: isRepeat),
    );
  }
}

class QuizPage extends StatefulWidget {
  final bool isRepeat;
  const QuizPage({super.key, required this.isRepeat});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? _selectedAnswer;
  String? _explanation;
  Color _bottomContainerColor =
      const Color.fromARGB(255, 229, 215, 227); // Initial color
  bool _showCorrectImage = false; // Track whether to show the correct image

  final List<Map<String, String>> _options = [
    {
      'answer':
          'stashing all your cash in your pocket or piggy bank and never spending it',
      'explanation':
          'Stashing money in your pocket and never spending it does not align with the purpose of saving, which is to use those funds for future needs, goals, or for much later.'
    },
    {
      'answer':
          'setting aside money to use much later, instead of spending it right away',
      'explanation': 'Explanation for Option 2'
    },
    {
      'answer': 'spending money immediately on luxury items like a bike',
      'explanation':
          'Saving involves setting aside money for future needs or goals, rather than spending it immediately on luxury items.'
    },
    {
      'answer': 'borrowing money from others to pay for expenses',
      'explanation':
          'Saving involves setting aside a portion of your own money for future use, rather than borrowing money to cover current spending.'
    },
  ];

  final String _correctAnswer =
      'setting aside money to use much later, instead of spending it right away';

  void _checkAnswer(String selectedAnswer) {
    setState(() {
      _selectedAnswer = selectedAnswer;
      if (selectedAnswer != _correctAnswer) {
        _explanation = _options.firstWhere(
            (option) => option['answer'] == selectedAnswer)['explanation'];
        _bottomContainerColor = const Color.fromARGB(
            255, 247, 204, 201); // Set to red for incorrect answer
        _showCorrectImage = false; // Hide correct image on incorrect answer
        _onWrongAnswer(context);
      } else {
        _explanation = " ";
        _bottomContainerColor = const Color.fromARGB(
            255, 177, 248, 130); // Set to green for correct answer
        _showCorrectImage = true; // Show correct image on correct answer
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_selectedAnswer == _correctAnswer) {
          if (Provider.of<CoinProvider>(context, listen: false).coin == 0) {
            Provider.of<CoinProvider>(context, listen: false).incrementCoin(context);
          }
          if (widget.isRepeat) {
            Provider.of<ProgressProvider>(context, listen: false)
                .currentLevelIncorrectQuestions
                .removeAt(0);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CoinApp(
                    coinNumber: 1,
                    description:
                        'What is Saving?')), // Replace NewPage() with your new page
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              // Container behind the text
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 525,
                  color: _bottomContainerColor, // Dynamic color based on answer
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top:
                            265.0), // Adjust the bottom padding to move the text down
                    child: Center(
                      child: Text(
                        _explanation != null && _explanation == " "
                            ? 'Correct! Great job!'
                            : '',
                        style: const TextStyle(
                          fontFamily: 'Source',
                          color: Color.fromARGB(255, 70, 129, 65),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 10.0),
                              child: Image.asset(
                                'assets/coin1mask.png',
                                height: 230,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Easy! Saving Means:',
                            style: TextStyle(
                              color: Color.fromARGB(255, 120, 112, 222),
                              fontFamily: 'Source',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ..._options.map((option) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: min(MediaQuery.of(context).size.width, 600),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                      255, 120, 112, 222), // Button background color
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.5), // Shadow color
                                      offset: const Offset(0, 2), // Shadow offset
                                      blurRadius: 4, // Shadow blur radius
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      35), // Optional: Adds rounded corners
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .transparent, // Make button background transparent
                                    shadowColor:
                                        Colors.transparent, // Remove default shadow
                                  ),
                                  onPressed: () => _checkAnswer(option['answer']!),
                                  child: Text(
                                    option['answer']!,
                                    style: const TextStyle(
                                      fontSize: 16.2,
                                      fontFamily: 'SourceSansPro',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white, // Text color
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      10), // Adjust the height for the space between buttons
                            ],
                          ),
                        );
                      }),
                      if (_explanation != null) ...[
                        const SizedBox(height: 9),
                        if (_explanation != " ")
                          const Text(
                            'Incorrect!',
                            style: TextStyle(
                              fontFamily: 'Source',
                              color: Color.fromARGB(255, 175, 33, 23),
                              fontSize: 19,
                            ),
                          ),
                        const SizedBox(height: 0),
                        Text(
                          _explanation!,
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16,
                            color: Color.fromARGB(255, 175, 33, 23),
                          ),
                        ),
                      ],
                      const SizedBox(height: 20), // Add space before the correct image
                      Visibility(
                        visible: _showCorrectImage,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom:
                                  20), // Adjust the bottom padding to move the image up
                          child: Center(
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/big green.png', // Path to the correct image asset
                                  height:
                                      70, // Adjust the height to make the image larger
                                  fit: BoxFit.contain,
                                ),
                                const Positioned(
                                  top: 15, // Adjust the top position as needed
                                  left: 35, // Adjust the left position as needed
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
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 3,
                        totalPages: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 1) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }
}
