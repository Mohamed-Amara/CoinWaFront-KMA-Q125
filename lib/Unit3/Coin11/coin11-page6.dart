import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page2.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page7.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'dart:math' as math;

import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin11Page6 extends StatelessWidget {
  const Coin11Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Coin11Page7()),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        purpleTextBubble("Wawa has a plan ..."),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 350,
                          height: MediaQuery.of(context).size.height - 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Image.asset('assets/wawaTalk.png',
                                          width: 100),
                                      Positioned(
                                        top: 0,
                                        right: -40,
                                        child: Image.asset(
                                            'assets/Unit 3/student_loan.png',
                                            width: 60),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40),
                                  // Use Expanded to allow the Text to take up available space and wrap
                                  const Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Wawa gets a student loan to cover tuition and textbook fees ...',
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Color(0xff5e17eb),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Makes a budgeting plan ...',
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Color(0xff5e17eb),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 100),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      
                                      Image.asset(
                                          'assets/Unit 3/plan.png',
                                          width: 60),
                                      Positioned(
                                        bottom: -40,
                                        left: -80,
                                        child: Image.asset('assets/wawaConfused.png',
                                            width: 100),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Image.asset('assets/wawaTalk.png',width: 100),
                                          Positioned(
                                            top: -22,
                                            child: Image.asset('assets/Unit 3/grad_cap.png', width: 80)
                                          ),

                                        ],
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: -40,
                                        child: Image.asset(
                                            'assets/Unit 3/student_loan.png',
                                            width: 60),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40),
                                  // Use Expanded to allow the Text to take up available space and wrap
                                  const Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'And knows that the loan can be payed back in the long run',
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Color(0xff5e17eb),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 2,
                      totalPages: 6,
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
