import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page5.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-quiz1scredit.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin12bad extends StatelessWidget {
  const Coin12bad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 36, 36),
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (Provider.of<ProgressProvider>(context, listen: false)
                              .sublevel ==
                          3 &&
                      Provider.of<ProgressProvider>(context, listen: false)
                              .level ==
                          12) {
                    Provider.of<ProgressProvider>(context, listen: false)
                        .setSublevel(context, 4);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Coin12Quiz1(isRepeat: false,)),
                  );
                },
                child: Center(
  child: SizedBox(
    height: 800, // Increase the height to ensure the image isn't cut off
    child: Stack(
      alignment: Alignment.center,
      children: [
        WawaTalking(
          'REMINDER: THIS IS BAD! Avoid paying larger amounts back by paying back on time!\n\n Your credit score can also DECREASE if you do not pay back your credit card on time!',
          "assets/blank.png",
        ),
        Positioned(
          top: 400.0, // Adjust this value to move the image down
          child: Image.asset(
            'assets/yellingwawa.png',
            width: 240,
          ),
        ),
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
                        totalPages: 7,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
