import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/getstarted-template.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_learn.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

Widget block(String text) {
  return Draggable<String>(
    data: text,
    feedback: Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff8383E6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
    childWhenDragging: Container(),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff8383E6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}

class Smart extends StatefulWidget {
  final bool isRepeat;
  const Smart({super.key, required this.isRepeat});

  @override
  State<Smart> createState() => _SmartState();
}

void navigateToNextQuestion(
    BuildContext context, int coinNumber, String description) {
  var progressProvider = Provider.of<ProgressProvider>(context, listen: false);

  // Check if there are any remaining incorrect questions
  if (progressProvider.currentLevelIncorrectQuestions.isNotEmpty) {
    // Retrieve the next incorrect question
    int nextIncorrectQuestion = progressProvider.currentLevelIncorrectQuestions.removeAt(0);

    // Determine the appropriate routing for the next incorrect question
    Widget nextScreen = redirect[coinNumber - 1][nextIncorrectQuestion];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ),
    );
  } else {
    // No more incorrect questions, navigate to the coin ending page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoinAnimationScreen(
          coinNumber: coinNumber,
          description: description,
        ),
      ),
    );
  }
}


class _SmartState extends State<Smart> {
  final Map<String, String> _smartMap = {
    'S': '',
    'M': '',
    'A': '',
    'R': '',
    'T': '',
  };

  final Map<String, bool?> _correctness = {
    'S': null,
    'M': null,
    'A': null,
    'R': null,
    'T': null,
  };

  final Map<String, String> _correctAnswers = {
    'S': 'SPECIFIC',
    'M': 'MEASURABLE',
    'A': 'ACHIEVABLE',
    'R': 'RELEVANT',
    'T': 'TIME-BOUND',
  };

  final List<String> _words = [
    'SPECIFIC',
    'ROOT',
    'MEASURABLE',
    'ROUND',
    'ACHIEVABLE',
    'TIME-BOUND',
    'SAFETY',
    'MEANING',
    'MIDDLE',
    'ANALYZE',
    'TIMID',
    'RELEVANT',
  ];

  bool _lostlife = false;
  bool _submitted = false;
  bool _allFilled = false; // Flag to track if all blocks are filled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TopBar(
                            currentPage: 2,
                            totalPages: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, top: 10, bottom: 40),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Image.asset(
                          'assets/wawaConfused.png',
                          width: 100,
                        ),
                        Stack(
                          clipBehavior:
                              Clip.none, // Allow the triangle to overflow
                          children: [
                            Positioned(
                              bottom: -15,
                              left: 30,
                              child:
                                  Image.asset('assets/triangle.png', width: 35),
                            ),
                            Container(
                              width: 250,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xff7870DE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'SMART Stands For ...',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.2,
                                    color: Color.fromARGB(255, 248, 248, 248),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ..._smartMap.keys.map((key) {
                    return LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        bool isWidthLarger =
                            constraints.maxWidth > constraints.maxHeight;
                        Widget content = Padding(
                          padding: const EdgeInsets.fromLTRB(50, 8, 8, 8),
                          child: DragTarget<String>(
                            onWillAccept: (data) {
                              return true;
                            },
                            onAccept: (data) {
                              setState(() {
                                _smartMap[key] = data;
                                _allFilled = _smartMap.values
                                    .every((value) => value.isNotEmpty);
                              });
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Stack(
                                clipBehavior: Clip.none, // Allow overflow
                                alignment: Alignment.centerLeft,
                                children: [
                                  Text(
                                    '$key: _______________',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff5E17EB),
                                    ),
                                  ),
                                  if (_smartMap[key] != '')
                                    Positioned(
                                      top: -10,
                                      left:
                                          60, // Adjust the left position if needed
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color(0xff8383E6),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5.0,
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            _smartMap[key]!,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_submitted && _correctness[key] != null)
                                    Positioned(
                                      left: -30,
                                      child: _correctness[key] == true
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                    ),
                                  if (_submitted &&
                                      _correctness[key] == false &&
                                      _smartMap[key] != '')
                                    Positioned(
                                      top: -5,
                                      right: -110,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.0,
                                          horizontal: 8.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color.fromARGB(255, 84, 153, 75),
                                        ),
                                        child: Text(
                                          _correctAnswers[key]!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (candidateData.isNotEmpty)
                                    Positioned(
                                      top: -10,
                                      left:
                                          35, // Adjust the left position if needed
                                      child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(12),
                                        color: Colors.grey,
                                        strokeWidth: 2,
                                        dashPattern: [6, 3],
                                        child: Container(
                                          height: 30,
                                          width: 150,
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        );
                        return isWidthLarger ? Center(child: content) : content;
                      },
                    );
                  }).toList(),
                  const SizedBox(height: 40),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: _words.map((word) => block(word)).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (_allFilled && !_submitted)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _submitted = true;
                            // Check correctness of all criteria and update _correctness map
                            _smartMap.forEach((key, value) {
                              _correctness[key] = _isCorrect(key, value);
                            });
                          });
                          _correctness.forEach(
                            (key, value) {
                              if (_correctness[key] == false &&
                                  _lostlife == false) {
                                if (!widget.isRepeat) {
                                  _onWrongAnswer(context);
                                  _lostlife = true;
                                }
                              }
                            },
                          );
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  if (_submitted)
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (Provider.of<ProgressProvider>(context,
                                          listen: false)
                                      .level ==
                                  3) {
                                Provider.of<ProgressProvider>(context,
                                        listen: false)
                                    .setSublevel(context, 3);
                              }
                              if (widget.isRepeat) {
                                navigateToNextQuestion(
                                    context, 3, "Setting Saving Goals");
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SmartLearn(),
                                  ),
                                );
                              }
                            },
                            child: Text('Next'),
                          ),
                        ],
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

  bool _isCorrect(String key, String value) {
    switch (key) {
      case 'S':
        return value.toUpperCase() == 'SPECIFIC';
      case 'M':
        return value.toUpperCase() == 'MEASURABLE';
      case 'A':
        return value.toUpperCase() == 'ACHIEVABLE';
      case 'R':
        return value.toUpperCase() == 'RELEVANT';
      case 'T':
        return value.toUpperCase() == 'TIME-BOUND';
      default:
        return false;
    }
  }
}

void _onWrongAnswer(BuildContext context) {
  Provider.of<LivesProvider>(context, listen: false).loseLife(context);
  if (Provider.of<ProgressProvider>(context, listen: false).level == 3) {
    Provider.of<ProgressProvider>(context, listen: false)
        .addIncorrectQuestion(context);
  }
  showLifeLossAnimation(context);
}

void main() {
  runApp(const MaterialApp(
    home: Smart(
      isRepeat: false,
    ),
  ));
}
