import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part3.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'dart:math' as math;

Widget purpleTextBubbleYellow(String description, List<String> highlightWords) {
  // Split the description into words
  List<TextSpan> textSpans = [];
  List<String> words = description.split(' ');

  for (String word in words) {
    // Check if the word should be highlighted
    bool shouldHighlight = highlightWords.contains(word);
    textSpans.add(
      TextSpan(
        text: '$word ',
        style: TextStyle(
          color: shouldHighlight ? const Color(0xfff5be4e) : Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xff7870de),
    ),
    width: 350,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: textSpans,
          ),
        ),
      ),
    ),
  );
}

class Coin9Page3Part2 extends StatelessWidget {
  const Coin9Page3Part2({super.key});

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
                        builder: (context) => const Coin9Page3Part3()),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 55),
                      purpleTextBubbleYellow(
                          "Basically you are subtracting the value of what you owe from the value of what you already have as assets", ["owe", "already", "have"],
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
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 8,
                                    ),
                                    top: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ))),
                          ),
                          Positioned(
                            top: 60,
                            left: 20,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                    fontFamily: 'Marker', fontSize: 25),
                                children: [
                                  TextSpan(
                                    text: 'ASSETS',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  TextSpan(
                                    text: ' - ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'LIABILITIES',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  TextSpan(
                                    text: ' =\n',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'NET WORTH',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: 30,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: 15,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -120,
                            left: 20,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Image.asset('assets/wawaTalk.png', width: 150,),
                                Positioned(
                                  right: -10,
                                  top: 5,
                                  child: Transform.rotate(
                                    angle: math.pi/5,
                                    child: Container(color: const Color(0xfffc9538), width: 5, height: 75,)
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
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
                      currentPage: 3,
                      totalPages: 10,
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
