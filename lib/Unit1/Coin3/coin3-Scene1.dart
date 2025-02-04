import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-not_smart.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:provider/provider.dart';

void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 3) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
}

class Coin3Scene1 extends StatelessWidget {
  const Coin3Scene1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            SingleChildScrollView(
              child: Column(
                children: [
                 const Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TopBar(
                          currentPage: 4,
                          totalPages: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 180,
                      width: 450,
                      decoration: const BoxDecoration(
                        color: Color(0xff8483E4),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: const EdgeInsets.all(30),
                      child: const Text(
                        'I am a student, and my goal is to buy an expensive supercar soon!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Source',
                          fontSize: 25.5,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Adjusted spacing
                  Center(
                    child: Image.asset(
                      'assets/supercarwawa.png',
                      width: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Color(0xff8483E4),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Is Wawa\'s goal SMART?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Source',
                            fontSize: 25.5,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15), // Adjusted spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
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
                          Positioned(
                            top: 50,
                            child: IconButton(
                              icon: const Text(
                                'YES!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (Provider.of<ProgressProvider>(context, listen: false).level == 3){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 5);
                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NotSmart(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 45), // Adjusted spacing
                      Stack(
                        alignment: Alignment.center,
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
                          Positioned(
                            top: 50,
                            child: IconButton(
                              icon: const Text(
                                'NO!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (Provider.of<ProgressProvider>(context, listen: false).level == 3){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 5);
                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NotSmart(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Adjusted spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/check.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 135), // Adjusted spacing
                      Image.asset(
                        'assets/x.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin3Scene1(),
  ));
}

