import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-saving_rule.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:provider/provider.dart';

class Coin3Build extends StatefulWidget {
  final bool isRepeat;
  const Coin3Build({super.key, required this.isRepeat});

  @override
  _Coin3BuildState createState() => _Coin3BuildState();
}

class _Coin3BuildState extends State<Coin3Build> {
  // The sentence broken into parts with blanks
  final List<String> _sentenceParts = [
    'My goal is to buy a ',
    '_',
    '',
    '_',
    ' car in 2 ',
    '_',
    's by saving ',
    '_',
    ' per ',
    '_',
    '!'
  ];

  // The correct options to fill in the blanks
  final List<String> _correctOptions = [
    '\$6000',
    'Affordable',
    'Year',
    '\$250',
    'Month'
  ];

  // All possible options
  final List<String> _options = [
    '\$1000000',
    '\$6000',
    '\$250',
    'Affordable',
    'Year',
    'Month',
    'Decade',
    '\$50',
    'Day',
    'Super',
    'Generation',
    '\$15',
    'Expensive'
  ];

  // The index of the current blank to be filled
  int _currentBlankIndex = 1; // Starting index of the first blank

  // List to hold the filled sentence parts
  List<String> _filledSentence = [];

  bool _allCorrect = false;

  @override
  void initState() {
    super.initState();
    // Initialize the filledSentence with the initial sentence parts
    _filledSentence = List.from(_sentenceParts);
  }

  // Function to handle option tap
  void _handleOptionTap(String option) {
    setState(() {
      if (_currentBlankIndex < _filledSentence.length) {
        if (_correctOptions[(_currentBlankIndex - 1) ~/ 2] == option) {
          _filledSentence[_currentBlankIndex] = option;
          _currentBlankIndex +=
              2; // Move to the next blank (skipping the text part)
          _options.remove(option); // Remove the selected option from the list

          // Check if all blanks are filled correctly
          if (_currentBlankIndex >= _filledSentence.length) {
            _allCorrect = true;
          }
        } else {
          if (!widget.isRepeat) {
            _onWrongAnswer(context);
            // Handle wrong option, e.g., show a message or do nothing
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Incorrect option, try again!')));
          }
        }
      }
    });
  }

  // Function to determine if a part is correct
  bool _isPartCorrect(int index) {
    if (index % 2 == 1) {
      return _filledSentence[index] == _correctOptions[(index - 1) ~/ 2];
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1DB),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TopBar(currentPage: 6, totalPages: 10),
                  Container(
                    width: double.infinity, // Full width of the screen
                    decoration: const BoxDecoration(
                      color: Color(0xFF8483E4), // Container background color
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20), // Rounded corners
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                    child: const Text(
                      'How can you change Wawa’s goal to be more SMART?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Source',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8483E4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: _filledSentence.map((part) {
                          int index = _filledSentence.indexOf(part);
                          if (part == '_') {
                            return const Text(
                              '____ ',
                              style: TextStyle(
                                fontFamily: 'Source',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return Text(
                              '$part ',
                              style: TextStyle(
                                fontFamily: 'Source',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: _isPartCorrect(index)
                                    ? const Color.fromARGB(255, 255, 231, 98)
                                    : Colors.white,
                              ),
                            );
                            //Color.fromARGB(255, 62, 0, 119) --> this is the purple color from before
                          }
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Image.asset('assets/supercarwawa.png',
                          height: 150), // Add your image here
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 189, 188,
                              255), // Background color same as top container
                          borderRadius: BorderRadius.circular(
                              20), // Adjust border radius here
                        ),
                        child: Wrap(
                          spacing: 20, // Adjust spacing between buttons
                          runSpacing: 20, // Adjust run spacing
                          children: _options.map((option) {
                            return ElevatedButton(
                              onPressed: () => _handleOptionTap(option),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                    0xFF8483E4), // Set button background color
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 24), // Adjust padding here
                              ),
                              child: Text(
                                option,
                                style: const TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 18,
                                  color: Colors.white, // Set text color to white
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (_allCorrect)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: SizedBox(
                        width: 200, // Set a fixed width for the button
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            backgroundColor: const Color(
                                0xFFFFF1DB), // Set button background color
                          ),
                          onPressed: () {
                            if (widget.isRepeat) {
                              navigateToNextQuestion(context, 3, "Setting Saving Goals");
                            } else {
                              Provider.of<ProgressProvider>(context,
                                      listen: false)
                                  .setSublevel(context, 7);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SavingRule(
                                      writing:
                                          'Awesome! I just got \$50 today for selling jewelry!',
                                      num: 1),
                                ),
                              );
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/big green.png', height: 100),
                              const Text(
                                'Way to go!',
                                style: TextStyle(
                                  fontFamily: 'Source',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
            ExitButton(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin3Build(
      isRepeat: false,
    ),
  ));
}

void _onWrongAnswer(BuildContext context) {
  Provider.of<LivesProvider>(context, listen: false).loseLife(context);
  if (Provider.of<ProgressProvider>(context, listen: false).level == 3) {
    Provider.of<ProgressProvider>(context, listen: false)
        .addIncorrectQuestion(context);
  }
  showLifeLossAnimation(context);
}
