import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page2.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page6.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'dart:math' as math;

import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin11Page5 extends StatelessWidget {
  const Coin11Page5({super.key});

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
                    MaterialPageRoute(builder: (context) => const Coin11Page6()),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        purpleTextBubble(
                            "However, Wawa doesn't have enough funding"),
                        const SizedBox(height: 40),
                        Image.asset("assets/Unit 3/medschool.png", width: 300),
                        Container(
                          width: double.infinity,
                          height: 400, // Adjust the height as needed
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                right:
                                    -70, // Adjust this value to control how much it cuts off
                                top:
                                    130, // Adjust this value to control vertical positioning
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Transform.rotate(
                                      angle: math.pi / 4,
                                      child: Container(
                                        width: 250,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: const Color(0xff5e17eb),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -50,
                                      left: -150,
                                      child: Image.asset(
                                          'assets/Unit 3/empty_wallet.png',
                                          width: 200),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 100,
                                left: -100,
                                child: Transform.rotate(
                                  angle: -math.pi / 4,
                                  child: Container(
                                    width: 250,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: const Color(0xff5e17eb),
                                    ),
                                  ),
                                ),
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
