import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

Widget coinWithText(String description) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset('assets/flatcoin.png', width: 180),
      Text(
        textAlign: TextAlign.center,
        description,
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
          fontSize: 18,
          height: 1.1,
          
        ),
      )
    ],
  );
}

class Coin9Intro extends StatelessWidget {
  final bool isRepeat;
  const Coin9Intro({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 45),
                    purpleTextBubble(
                        "Remember searching up your favourite celebrity's networth? Let's say it is \$8,000,000 dollars for Wawa.\nIs that:"),
                    const SizedBox(height: 20),
                    Container(
                      width: 350,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    if (!isRepeat) {
                                      _onWrongAnswer(context);
                                      if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
                                         Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
                                      }
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Coin9Page2()),
                                    );
                                  }
                                  else{
                                    navigateToNextQuestion(context, 9, "Net Worth");
                                  }
                                  },
                                  child: coinWithText(
                                      'How much\nthey make\na year')),
                            ],
                          ),
                          Text(
                            'OR',
                            style: TextStyle(
                                color: Color(0xff7870de),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (!isRepeat) {
                                      if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
                                         Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
                                      }
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Coin9Page2()),
                                    );
                                  }
                                  else{
                                    navigateToNextQuestion(context, 9, "Net Worth");
                                  }
                                    
                                },
                                child: coinWithText(
                                    'Their worth\nbased on\nassets and\nliabilities'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
                        totalPages: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }
}
