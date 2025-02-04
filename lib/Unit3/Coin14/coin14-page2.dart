import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page2-credit.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page2-money.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin14Page2 extends StatelessWidget {
  const Coin14Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  purpleTextBubble('Wawa has 2 options to pay! Pick one'),
                  const SizedBox(height: 20),
                  Image.asset('assets/Unit 3/cash_register.png', width: 250),
                  const SizedBox(height: 30),
                  Container(
                    width: 350,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Coin14Page2Credit()),
                                  );
                                },
                                child: Image.asset(
                                    'assets/Unit 3/credit_card.png',
                                    width: 200)),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text("OR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff5e17eb),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Coin14Page2Money()),
                                  );
                                },
                                child: Image.asset('assets/userdollar.png',
                                    width: 200)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
