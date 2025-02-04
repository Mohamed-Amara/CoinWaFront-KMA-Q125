import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page4.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin14Page3 extends StatelessWidget {
  const Coin14Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (Provider.of<ProgressProvider>(context, listen: false).level == 14) {
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 4);
                }
               
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin14Page4()),
                );
              },
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Text(
                        "Great Choice Using a Credit Card!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff5e17eb),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      const SizedBox(height: 40),
                      SpeechBubbleYellow("Since the credit card uses money from the bank (borrowed). You have to pay it back later.", true, ["have", "to", "pay", "it", "back", "later."]),
                      const SizedBox(height: 15),
                      Container(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/wawaTalk.png', width: 100)
                          ],
                        )
                      ),
                      const SizedBox(height: 20),
                      SpeechBubbleYellow("But what's the deadline? Well, the bank gives you a grace period around 21-25 days for you to pay the amount back without interest charges", false, ["21-25","days", "without", "interest", "charges"]),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/wawaup.png', width: 100)
                          ],
                        )
                      )
                  ],
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
