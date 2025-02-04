import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';
import '../../Providers/coin_provider.dart';

void main() {
  runApp(const Coin4Quiz2(isRepeat: false,));
}

class Coin4Quiz2 extends StatelessWidget {
  final bool isRepeat;
  const Coin4Quiz2({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizPage(isRepeat: false,),
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
          'When your money is constant when saving',
      'explanation':
          'Not Quite!'
    },
    {
      'answer':
          'The amount of money you would have if you didn’t spend it',
      'explanation': 'Try Again!'
    },
    {
      'answer': 'Money that the bank pays you for parking your cash in a savings account',
      'explanation':
          '.'
    },
   
  ];

  final String _correctAnswer =
      'Money that the bank pays you for parking your cash in a savings account';

  void _checkAnswer(String selectedAnswer) {
    setState(() {
      _selectedAnswer = selectedAnswer;
      if (selectedAnswer != _correctAnswer) {
        _explanation = _options.firstWhere(
            (option) => option['answer'] == selectedAnswer)['explanation'];
        _bottomContainerColor = const Color.fromARGB(
            255, 247, 204, 201); // Set to red for incorrect answer
        _showCorrectImage = false; // Hide correct image on incorrect answer
        if (!widget.isRepeat){
          _onWrongAnswer(context);
        }
        
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
          if (Provider.of<CoinProvider>(context, listen: false).coin == 5) {
            Provider.of<CoinProvider>(context, listen: false).incrementCoin(context);
          }
          navigateToNextQuestion(context, 4,  'Where to Save Your Money');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => const CoinApp(
          //           coinNumber: 4,
          //           description:
          //               'Where to Save Your Money')), // Replace NewPage() with your new page
          // );
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
                  height: 515,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60, right: 10.0),
                            child: Image.asset(
                              'assets/wawaConfused.png',
                              height: 130,
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
                          textAlign: TextAlign.center,
                          'What is Interest in Savings?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontFamily: 'Source',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                                    20), // Adjust the height for the space between buttons
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
                    const Spacer(), // Add a spacer to push the image to the bottom
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
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 6,
                        totalPages: 6,
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
    if (Provider.of<ProgressProvider>(context, listen: false).level == 4) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }
}
