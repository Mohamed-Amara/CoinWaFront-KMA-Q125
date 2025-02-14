import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-Scene1.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-quiz.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-whatISsaving.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-Scene1.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-catchgame1.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-game2.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-intro.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-savinggoal.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-select.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-shopping_intro.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-Scene1.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-not_smart.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-saving_rule.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-sentencebuild.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_learn.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-quiz1.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-quiz2.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/matching-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-quiz1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-select.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page3.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page5.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page6.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz3.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/Coin8-page8.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page3.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page5.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page6.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page7.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page9.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-quiz1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page6.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-drag.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-intro.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page2.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page3.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page4.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz1.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-cardexplain.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditenter.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditright.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-folder.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-intro.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-newinterest.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-quiz1scredit.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-limit.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-magic.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-shuff.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-buscard.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stucard.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stancard.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-busquiz.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-studquiz.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stanquiz.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-busquiz2.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-studquiz2.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stanquiz2.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-scene1.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-scene2.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-scene3.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-creditscore2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-intro.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page3.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page4.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-quiz1.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-quiz2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';

List<MatchingPair> matchingPairs = [
  MatchingPair(
    scenario: 'Your unexpected medical bill',
    benefit: 'Build an emergency fund',
  ),
  MatchingPair(
    scenario: "You're Retiring",
    benefit: 'Build a long-term life savings account',
  ),
  MatchingPair(
    scenario: "Your University/College Tuition",
    benefit: 'Have an education savings account',
  ),
  MatchingPair(
    scenario: 'You go on vacation',
    benefit: 'Save money for leisure/recreation',
  ),
  MatchingPair(
    scenario: 'You buy a house',
    benefit: 'Save for a large one-time payment',
  )
];

List redirect = [
    {1: const Scene1(), 2: const SavingQ(), 3: const Coin1Quiz(isRepeat: true,)},
    {
      1: const Coin2Intro(),
      2: Matching(matchingPairs: matchingPairs, isRepeat: true),
      3: const Coin2Scene1(isRepeat: true,),
      4: const CatchIntro1(),
      5: const FallingCoins1(),
      6: const ShopList(),
      7: const CatchingGameApp()
    },

  
    {
      1: const Coin3Intro(),
      2: const Smart(isRepeat: true,),
      3: const SmartLearn(),
      4: const Coin3Scene1(),
      5: const NotSmart(),
      6: const Coin3Build(isRepeat: true,),
      7: const SavingRule(
          writing: 'Awesome! I just got \$50 today for selling jewelry!',
          num: 1),
      8: const SavingGraph(
          writing: 'I can split the \$50 into the following categories',
          imagestring: 'assets/Coin-3/piechart1.png',
          num: 1),
      9: const SavingRule(
        writing:
            'This method works as I spend some and still leave some to save! But we can break it down further ...',
        num: 2,
      ),
      10: const SavingGraph(
          writing:
              'This is called the 50/30/20 budget rule and can help you achieve your saving goals!',
          imagestring: 'assets/Coin-3/piechart2.png',
          num: 2),
    },
  
  
    {5: const Coin4Quiz1(isRepeat: true), 6: const Coin4Quiz2(isRepeat: true,)},
  
   {},
    
    {1: const Coin6Intro(), 2: const Coin6Explain1(), 3: const Coin6Select(), 4: const Coin6Quiz1(isRepeat: true), 5: const Coin6Quiz2(isRepeat: true) },
  {
    1: const Coin7Intro(),
    2: const Coin7Page3(),
    3: const Coin7Page4(),
    4: const Coin7Page5(),
    5: const Coin7Page6(),
    6: const Coin7Quiz1(isRepeat: true),
    7: const Coin7Quiz2(isRepeat: true),
    8: const Coin7Quiz3(isRepeat: true),
    9: const Coin7Quiz4(isRepeat: true),
  },
  {
    1: const Coin8Intro(),
    2: const Coin8Page2(),
    3: const Coin8Page3(),
    4: const Coin8Page4(),
    5: const Coin8Page5(),
    6: const Coin8Page6(),
    7: const Coin8Page7(),
    8: const Coin8Page8(),
    9: const Coin8Page9(),
    10: const Coin8Quiz1(isRepeat: true),
    11: const Coin8Quiz2(isRepeat: true)
  },
  {
    1: const Coin9Intro(isRepeat: true),
    2: const Coin9Page2(),
    3: const Coin9Page3Part1(),
    4: const Coin9Page4(isRepeat: true,),
    5: const Coin9Page5(isRepeat: true,),
    6: const Coin9Page6(isRepeat: true,),
    7: const Coin9Quiz1(isRepeat: true),
  },
  {
    1: const Coin13intro(),
  },
  {
    1: const Coin11Intro(),
    2: const Coin11Page2(),
    3: const Coin11Page8(isRepeat: true),
    4: const Coin11Drag(isRepeat: true),
    5: const Coin11Quiz1(isRepeat: true),
    6: const Coin11Quiz2(isRepeat: true)
  },
  {
    1: const Coin12intro(),
    2: const Coin12explain(),
    3: const Coin12interest4(),
    4: const Coin12Quiz1(isRepeat: true),
    5: const Coin12creditenter(),
    6: const Coin12creditright(),
    7: const Coin12folder()
  },
  {},
  {
    1: const Coin14Intro(),
    2: const Coin14Page2(),
    3: const Coin14Page3(),
    4: const Coin14Page4(),
    5: const Coin14CreditScore2(),
    6: const Coin14Quiz1(isRepeat: true),
    7: const Coin14Quiz2(isRepeat: true),
  }
];

List redirect2 = [
    {1: const Scene1(), 2: const SavingQ(), 3: const Coin1Quiz(isRepeat: false,)},
    {
      1: const Coin2Intro(),
      2: Matching(matchingPairs: matchingPairs, isRepeat: false),
      3: const Coin2Scene1(isRepeat: false,),
      4: const CatchIntro1(),
      5: const FallingCoins1(),
      6: const ShopList(),
      7: const CatchingGameApp()
    },

  
    {
      1: const Coin3Intro(),
      2: const Smart(isRepeat: false,),
      3: const SmartLearn(),
      4: const Coin3Scene1(),
      5: const NotSmart(),
      6: const Coin3Build(isRepeat: false,),
      7: const SavingRule(
          writing: 'Awesome! I just got \$50 today for selling jewelry!',
          num: 1),
      8: const SavingGraph(
          writing: 'I can split the \$50 into the following categories',
          imagestring: 'assets/Coin-3/piechart1.png',
          num: 1),
      9: const SavingRule(
        writing:
            'This method works as I spend some and still leave some to save! But we can break it down further ...',
        num: 2,
      ),
      10: const SavingGraph(
          writing:
              'This is called the 50/30/20 budget rule and can help you achieve your saving goals!',
          imagestring: 'assets/Coin-3/piechart2.png',
          num: 2),
    },
  
  
    {5: const Coin4Quiz1(isRepeat: false), 6: const Coin4Quiz2(isRepeat: false,)},
  
   { },
    
    {1: const Coin6Intro(), 2: const Coin6Explain1(), 3: const Coin6Select(), 4: const Coin6Quiz1(isRepeat: false), 5: const Coin6Quiz2(isRepeat: false) },
  {1: const Coin7Intro(),
    2: const Coin7Page3(),
    3: const Coin7Page4(),
    4: const Coin7Page5(),
    5: const Coin7Page6(),
    6: const Coin7Quiz1(isRepeat: false),
    7: const Coin7Quiz2(isRepeat: false),
    8: const Coin7Quiz3(isRepeat: false),
    9: const Coin7Quiz4(isRepeat: false),},
  {
    1: const Coin8Intro(),
    2: const Coin8Page2(),
    3: const Coin8Page3(),
    4: const Coin8Page4(),
    5: const Coin8Page5(),
    6: const Coin8Page6(),
    7: const Coin8Page7(),
    8: const Coin8Page8(),
    9: const Coin8Page9(),
    10: const Coin8Quiz1(isRepeat: false),
    11: const Coin8Quiz2(isRepeat: false)
  },
  {
    1: const Coin9Intro(isRepeat: false),
    2: const Coin9Page2(),
    3: const Coin9Page3Part1(),
    4: const Coin9Page4(isRepeat: false,),
    5: const Coin9Page5(isRepeat: false,),
    6: const Coin9Page6(isRepeat: false,),
    7: const Coin9Quiz1(isRepeat: false),
  },
  {},
  {
    1: const Coin11Intro(),
    2: const Coin11Page2(),
    3: const Coin11Page8(isRepeat: false),
    4: const Coin11Drag(isRepeat: false),
    5: const Coin11Quiz1(isRepeat: false),
    6: const Coin11Quiz2(isRepeat: false)
  },
  {
    1: const Coin12intro(),
    2: const Coin12explain(),
    3: const Coin12interest4(),
    4: const Coin12Quiz1(isRepeat: false),
    5: const Coin12creditenter(),
    6: const Coin12creditright(),
    7: const Coin12folder()
  },
  {
    1: const Coin13intro(), // limit.dart
  },
  {
    1: const Coin14Intro(),
    2: const Coin14Page2(),
    3: const Coin14Page3(),
    4: const Coin14Page4(),
    5: const Coin14CreditScore2(),
    6: const Coin14Quiz1(isRepeat: false),
    7: const Coin14Quiz2(isRepeat: false),
  }
];

class CoinStackTemplate extends StatelessWidget {
  final String title;
  final Widget transfer;
  final int sublevelCount;
  final int levelNumber;

  const CoinStackTemplate(
      {super.key,
      required this.title,
      required this.transfer,
      required this.sublevelCount,
      required this.levelNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.15), // Decreased the height
                Center(
                  child: Stack(
                    clipBehavior: Clip.none, // Allow the triangle to overflow
                    children: [
                      Positioned(
                        bottom: -15,
                        left: 150,
                        child: Image.asset('assets/triangle.png', width: 35),
                      ),
                      Container(
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xff7870DE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/wawaConfused.png',
                                width: 100,
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 1.2,
                                      color: Color.fromARGB(255, 248, 248, 248),
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                    maxLines:
                                        3, // Set this to an appropriate number based on your needs
                                    overflow: TextOverflow.ellipsis,
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
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/flatcoin.png',
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => transfer,
                          ),
                        );
                      },
                    ),
                    Positioned(
                        top: 40,
                        child: IconButton(
                          icon: const Text(
                            'Get \nStarted!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            final progressProvider = Provider.of<ProgressProvider>(
                                context,
                                listen: false);
                            
                            if (progressProvider.level == levelNumber && progressProvider.level != 4) {
                              if (progressProvider.sublevel - 1 < redirect2[levelNumber - 1].length) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => (redirect2[levelNumber - 1])[progressProvider.sublevel]
                                  ),
                                );
                              } else {
                                // Handle the case where sublevel is out of range
                                print('Sublevel out of range');
                              }
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => transfer,
                                ),
                              );
                            }
                          },
                        )),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height *
                      0.35, // Adjust the position as needed
                  child: Center(
                    child: Image.asset(
                      'assets/coinstack.png',
                      width: min(MediaQuery.of(context).size.width * 0.9, 400),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            ExitButton(),
            ],
            
          ),
        ),
      ),
    );
  }
}
