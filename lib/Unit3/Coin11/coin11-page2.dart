import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part3.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page3.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';


class Coin11Page2 extends StatelessWidget {
  const Coin11Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures taps are detected anywhere
      onTap: () {
        if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
          Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin11Page3()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 55),
                      purpleTextBubbleYellow(
                        "So, how can someone borrow this money? Well ...", ["borrow"],
                      ),
                      const SizedBox(height: 40),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 350,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(color: Colors.black, width: 8),
                                top: BorderSide(color: Colors.black, width: 1),
                                right: BorderSide(color: Colors.black, width: 1),
                                left: BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 12,
                            child: SizedBox(
                              width: 320,
                              child: RichText(
                                softWrap: true,
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Marker', fontSize: 22),
                                  children: [
                                    TextSpan(
                                      text: 'YOU CAN BORROW MONEY TO BUY THINGS YOU CANNOT AFFORD YET THROUGH ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'LOANS',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Row(
                              children: [
                                _colorBox(Colors.red),
                                _colorBox(Colors.green),
                                _colorBox(Colors.blue, width: 10),
                                _colorBox(Colors.grey, width: 15),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -120,
                            left: 20,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Image.asset('assets/wawaTalk.png', width: 150),
                                Positioned(
                                  right: -10,
                                  top: 5,
                                  child: Transform.rotate(
                                    angle: math.pi / 5,
                                    child: Container(
                                      color: const Color(0xfffc9538),
                                      width: 5,
                                      height: 75,
                                    ),
                                  ),
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
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
                        totalPages: 6,
                      ),
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

  Widget _colorBox(Color color, {double width = 30, double height = 10}) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

}
