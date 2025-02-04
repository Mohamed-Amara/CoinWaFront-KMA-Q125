import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/getstarted-template.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-Scene1.dart';
import 'dart:math';

import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class MatchingPair {
  final String scenario;
  final String benefit;

  MatchingPair({required this.scenario, required this.benefit});
}

class Matching extends StatefulWidget {
  final List<MatchingPair> matchingPairs;
  final bool isRepeat;

  const Matching(
      {super.key, required this.matchingPairs, required this.isRepeat});

  @override
  State<Matching> createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  List<String> shuffledBenefits = [];

  String? selectedScenario;
  String? selectedBenefit;
  Set<int> matchedScenarioIndices = {};
  Set<int> matchedBenefitIndices = {};

  void navigateToNextQuestion(
      BuildContext context, int coinNumber, String description) {
    var progressProvider =
        Provider.of<ProgressProvider>(context, listen: false);


    // Check if there are any remaining incorrect questions
    if (progressProvider.currentLevelIncorrectQuestions.isNotEmpty) {
      int nextIncorrectQuestion; 
      do {
      nextIncorrectQuestion = progressProvider.currentLevelIncorrectQuestions.removeAt(0);
    } while (nextIncorrectQuestion == 2 && progressProvider.currentLevelIncorrectQuestions.isNotEmpty);

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

  @override
  void initState() {
    super.initState();

    // Extracting benefits from matchingPairs and shuffling them
    shuffledBenefits =
        widget.matchingPairs.map((pair) => pair.benefit).toList();
    shuffledBenefits.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final allMatched =
        matchedScenarioIndices.length == widget.matchingPairs.length;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TopBar(
                            currentPage: 2,
                            totalPages: 7,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 50,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/wawaTalk.png",
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 190,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color(0xff7870DE),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: const Center(
                            child: Text(
                              'Match the Following Items!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.5,
                                  color: Color.fromARGB(255, 248, 248, 248),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'SCENARIO    ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xff5E17EB),
                        ),
                      ),
                      Text(
                        'ACTION   ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xff5E17EB),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(widget.matchingPairs.length,
                                (index) {
                              final pair = widget.matchingPairs[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Opacity(
                                  opacity: matchedScenarioIndices.contains(index)
                                      ? 0.5
                                      : 1.0,
                                  child: SizedBox(
                                    width: double
                                        .infinity, // Ensures the button takes the full width of its parent
                                    height:
                                        60, // Set the fixed height for the button
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (selectedScenario == pair.scenario) {
                                            selectedScenario = null;
                                          } else {
                                            selectedScenario = pair.scenario;
                                          }
        
                                          if (selectedScenario != null &&
                                              selectedBenefit != null) {
                                            final matchIndex =
                                                widget.matchingPairs.indexWhere(
                                              (p) =>
                                                  p.scenario ==
                                                      selectedScenario &&
                                                  p.benefit == selectedBenefit,
                                            );
                                            if (matchIndex != -1) {
                                              // Correct match
                                              matchedScenarioIndices
                                                  .add(matchIndex);
                                              matchedBenefitIndices.add(
                                                  shuffledBenefits
                                                      .indexOf(selectedBenefit!));
                                              selectedScenario = null;
                                              selectedBenefit = null;
                                            } else {
                                              if (!widget.isRepeat){
                                                  _onWrongAnswer(context);
                                                }
                                              // Incorrect match
                                              selectedScenario = null;
                                              selectedBenefit = null;
                                            }
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            selectedScenario == pair.scenario
                                                ? Colors.blue
                                                : const Color.fromARGB(
                                                    255, 120, 112, 222),
                                      ),
                                      child: Text(
                                        pair.scenario,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            height: 1, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              min(widget.matchingPairs.length,
                                  shuffledBenefits.length),
                              (index) {
                                final benefit = shuffledBenefits[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Opacity(
                                    opacity: matchedBenefitIndices.contains(index)
                                        ? 0.5
                                        : 1.0,
                                    child: SizedBox(
                                      width: double
                                          .infinity, // Ensures the button takes the full width of its parent
                                      height:
                                          60, // Set the fixed height for the button
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (selectedBenefit == benefit) {
                                              selectedBenefit = null;
                                            } else {
                                              selectedBenefit = benefit;
                                            }
        
                                            if (selectedScenario != null &&
                                                selectedBenefit != null) {
                                              final matchIndex =
                                                  widget.matchingPairs.indexWhere(
                                                (p) =>
                                                    p.scenario ==
                                                        selectedScenario &&
                                                    p.benefit == selectedBenefit,
                                              );
                                              if (matchIndex != -1) {
                                                // Correct match
                                                matchedScenarioIndices
                                                    .add(matchIndex);
                                                matchedBenefitIndices.add(
                                                    shuffledBenefits.indexOf(
                                                        selectedBenefit!));
                                                selectedScenario = null;
                                                selectedBenefit = null;
                                              } else {
                                                // Incorrect match
                                                if (!widget.isRepeat){
                                                  _onWrongAnswer(context);
                                                }
                                                selectedScenario = null;
                                                selectedBenefit = null;
                                              }
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              selectedBenefit == benefit
                                                  ? Colors.blue
                                                  : const Color.fromARGB(
                                                      255, 120, 112, 222),
                                        ),
                                        child: Text(
                                          benefit,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            height: 1,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (allMatched)
                    IconButton(
                        onPressed: () {
                          if (Provider.of<ProgressProvider>(context,
                                      listen: false)
                                  .level ==
                              2) {
                            Provider.of<ProgressProvider>(context, listen: false)
                                .setSublevel(context, 3);
                          }
        
                          if (widget.isRepeat) {
                            navigateToNextQuestion(context, 2, "Importance of Saving?");
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Coin2Scene1(isRepeat: false),
                              ),
                            );
                          }
                        },
                        icon: Center(
                          child: Stack(
                            alignment: Alignment
                                .center, // This centers the children within the Stack
                            children: [
                              Image.asset(
                                'assets/big green.png',
                                width: 180,
                              ),
                              const Text(
                                'Kudos!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _onWrongAnswer(BuildContext context) {
  Provider.of<LivesProvider>(context, listen: false).loseLife(context);
  if (Provider.of<ProgressProvider>(context, listen: false).level == 2) {
    Provider.of<ProgressProvider>(context, listen: false)
        .addIncorrectQuestion(context);
  }
  showLifeLossAnimation(context);
}
