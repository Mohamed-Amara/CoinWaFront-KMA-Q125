import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-creditscore2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin14Page4 extends StatelessWidget {
  const Coin14Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Provider.of<ProgressProvider>(context, listen: false).level == 14) {
          Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 5);
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin14CreditScore2()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpeechBubbleYellow(
                      "Now you might be wondering, shouldn't I only use a credit card to pay for items I can't afford?",
                      true,
                      ["afford?"],
                    ),
                    const SizedBox(height: 20),
                    SpeechBubbleYellow(
                      "Why would I borrow money from the bank if I already have the money?",
                      false,
                      ["already", "have"],
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset('assets/wawaTalk.png', width: 150),
                        Positioned(
                          right: -30,
                          top: 35,
                          child: Image.asset('assets/Unit 3/credit_card.png', width: 50),
                        ),
                      ],
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
                        currentPage: 4,
                        totalPages: 7,
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
