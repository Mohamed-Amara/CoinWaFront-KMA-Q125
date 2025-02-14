import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part3.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page3.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page5.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-shuff.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class Coin13magic extends StatelessWidget {
  const Coin13magic({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Makes the whole screen tappable
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Coin13shuffle(),
          ),
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
                      const SizedBox(height: 105),
                      purpleTextBubble('Magician Wawa wants you to pick a card... \nA Credit Card That is!'),
                      const SizedBox(height: 160),
                      Container(
                        width: 350,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/magicwawa.png',
                              width: 445,
                            ),
                          ],
                        ),
                      )
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
      ),
    );
  }
}