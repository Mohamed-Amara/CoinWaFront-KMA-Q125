import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page9-bus.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page9-car.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin11Page8 extends StatelessWidget {
  final bool isRepeat;
  const Coin11Page8({super.key, required this.isRepeat});

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
                        "Now, let's say Wawa needs a way to travel to medical school. Choose an option:"),
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
      
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Coin11Page9Car()),
                                    );
                                  }
                                  else{
                                    navigateToNextQuestion(context, 11, "Credit Cards");
                                  }
                                  },
                                  child: coinWithText(
                                      'Use the loan\nto buy\na used car')),
                                       const SizedBox(width: 40),
                                      const Text('Saves Wawa\n20 minutes of\ntravel time!', style: TextStyle(
                                color: Color(0xff5e17eb),
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                            ],
                          ),
                          const Text(
                            'OR',
                            style: TextStyle(
                                color: Color(0xff7870de),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('Saves Wawa a\nlot of money!', style: TextStyle(
                                color: Color(0xff5e17eb),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                                const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  if (!isRepeat) {

                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Coin11Page9Bus()),
                                    );
                                  }
                                  else{
                                    navigateToNextQuestion(context, 11, "Credit Cards");
                                  }
                                    
                                },
                                child: coinWithText(
                                    'Use public\ntransport'),
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
                        currentPage: 3,
                        totalPages: 6,
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
    if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }
}
