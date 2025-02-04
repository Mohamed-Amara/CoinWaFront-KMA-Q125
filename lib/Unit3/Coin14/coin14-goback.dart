import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-creditscore1.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page2-credit.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';


class Coin14GoBack extends StatelessWidget {
  const Coin14GoBack({super.key});

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
                  MaterialPageRoute(builder: (context) => const Coin14Page2Credit()),
                );
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        purpleTextBubble(
                          "Let's go back and say you chose the Credit Card option!",
                        ),
                        Image.asset("assets/Unit 3/cash_register.png", width: 250),
                        Image.asset('assets/creditcardintro.png', width: 300)
                      ],
                    ),
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
