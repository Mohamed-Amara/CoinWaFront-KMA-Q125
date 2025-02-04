import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-borrow.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-savephone.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';
import '../../Templates/animation_util.dart'; // Import the utility file

class Coin2Scene1 extends StatelessWidget {
  final bool isRepeat;
  const Coin2Scene1({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 5, right: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                      color: Color(0xff8483E4), // Container background color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.only(
                        left: 35, right: 35, top: 20, bottom: 20),
                    child: const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'You dropped your phone! What do you do to repair it?',
                        style: TextStyle(
                          fontFamily: 'Source',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
                        Center(
                          child: Image.asset(
                            'assets/wawaphone.png',
                            width: 350,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 30), // Adjusted spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Image.asset(
                                        'assets/flatcoin.png',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      onPressed: () {
                                        // Add your onPressed logic here
                                      },
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 40,
                                  child: IconButton(
                                    icon: const Text(
                                      'BORROW \nMONEY!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (isRepeat) {
                                        
                                          Provider.of<ProgressProvider>(context,
                                                  listen: false)
                                              .currentLevelIncorrectQuestions
                                              .removeAt(0);
                                        
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CoinAnimationScreen(
                                                    coinNumber: 2,
                                                    description:
                                                        "Importance of Saving?"),
                                          ),
                                        );
                                      } else {
                                        _onWrongAnswer(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Coin2debt(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20), // Adjusted spacing
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Image.asset(
                                        'assets/flatcoin.png',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      onPressed: () {
                                        // Add your onPressed logic here
                                      },
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 40,
                                  child: IconButton(
                                    icon: const Text(
                                      'USE \nSAVINGS!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (isRepeat) {
                                         
                                          Provider.of<ProgressProvider>(context,
                                                  listen: false)
                                              .currentLevelIncorrectQuestions
                                              .removeAt(0);
                                        
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CoinAnimationScreen(
                                                    coinNumber: 2,
                                                    description:
                                                        "Importance of Saving?"),
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Coin2Savephone(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 0), // Adjusted spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/bank.png',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 60), // Adjusted spacing
                            Image.asset(
                              'assets/savingjar.png',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ExitButton(),
            const Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TopBar(
                          currentPage: 3,
                          totalPages: 7,
                        ),
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin2Scene1(
      isRepeat: false,
    ),
  ));
}

void _onWrongAnswer(BuildContext context) {
  Provider.of<LivesProvider>(context, listen: false).loseLife(context);
  if (Provider.of<ProgressProvider>(context, listen: false).level == 2) {
    Provider.of<ProgressProvider>(context, listen: false)
        .addIncorrectQuestion(context);
  }
  showLifeLossAnimation(context);
}
