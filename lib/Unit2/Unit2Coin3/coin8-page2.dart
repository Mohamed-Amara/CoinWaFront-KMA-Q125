import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page3.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'dart:math' as math;

import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin8Page2 extends StatelessWidget {
  const Coin8Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            
            GestureDetector(
              onTap: () {
                if (Provider.of<ProgressProvider>(context, listen: false).level == 8) {
                    Provider.of<ProgressProvider>(context, listen: false).setSublevel(context,3);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Coin8Page3()),
                  );
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      purpleTextBubble("You see BaBa (Wawa's second cousin, twice removed) has a marker!"),
                      Image.asset('assets/Unit 2/baba_young.png', width: 350),
                      Text(textAlign: TextAlign.center, 'Tap BaBa to borrow the red marker!', style: TextStyle(color: Color(0xff5e17eb), fontWeight: FontWeight.bold, fontSize: 18),)
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
                        currentPage: 2,
                        totalPages: 11,
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
