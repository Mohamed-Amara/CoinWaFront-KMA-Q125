import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-creditscore1.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';


class Coin14Page2Money extends StatelessWidget {
  const Coin14Page2Money({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
               
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin14CreditScore1()),
                );
              },
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      purpleTextBubble(
                        "Nice choice! Paying by the cash you have means you don't have anything to pay back afterwards",
                      ),
                      const SizedBox(height: 120),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            color: const Color(0xff545454),
                            width: double.infinity, // Make sure the container takes full width
                            height: MediaQuery.of(context).size.height - 240, // Calculate remaining height
                          ),
                          Positioned(
                            top: -30,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                'assets/Unit 3/movie_seat.png',
                width: 350,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )

            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 2,
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
