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
  runApp(const Coin4Quiz2(isRepeat: false));
}

class Coin4Quiz2 extends StatelessWidget {
  final bool isRepeat;
  const Coin4Quiz2({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
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
  Color _bottomContainerColor = const Color(0xff7870de); // Purple background
  bool _showCorrectImage = false;

  final List<Map<String, String>> _options = [
    {
      'answer': 'When your money is constant when saving',
      'explanation': 'Not Quite!'
    },
    {
      'answer': 'The amount of money you would have if you didn’t spend it',
      'explanation': 'Try Again!'
    },
    {
      'answer': 'Money that the bank pays you for parking your cash in a savings account',
      'explanation': 'Correct!'
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
        _bottomContainerColor = const Color.fromARGB(255, 247, 204, 201); // Red for incorrect
        _showCorrectImage = false;
        if (!widget.isRepeat) {
          _onWrongAnswer(context);
        }
      } else {
        _explanation = "Correct!";
        _bottomContainerColor = const Color(0xff7870de); // Keep purple for correct
        _showCorrectImage = true;
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
          // Replaced navigateToNextQuestion with direct navigation
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const CoinApp(coinNumber: 4, description: 'Where to Save Your Money'),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff7870de), // Full purple background
        body: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/wawaConfused.png', width: 100)
                            ],
                          ),
                        ],
                      ),
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
                          color: Colors.white,
                          fontFamily: 'Source',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: _options.map((option) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: min(MediaQuery.of(context).size.width, 600),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2), // Light purple
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  onPressed: () => _checkAnswer(option['answer']!),
                                  child: Text(
                                    option['answer']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  if (_explanation != null) ...[
                    const SizedBox(height: 9),
                    Center(
                      child: Text(
                        _explanation!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: _explanation == "Correct!"
                              ? const Color(0xff4caf50)
                              : const Color(0xfff44336),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  Visibility(
                    visible: _showCorrectImage,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoinApp(
                                coinNumber: 4,
                                description: 'Where to Save Your Money',
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/big green.png',
                              height: 70,
                              fit: BoxFit.contain,
                            ),
                            const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
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
