import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page6.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page9.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin8Page8 extends StatelessWidget {
  const Coin8Page8({super.key});


Widget SpeechBubble(String description, bool isLeft) {
  return Stack(
    clipBehavior: Clip.none, // Allow the triangle to overflow
    children: [
      Positioned(
        bottom: -15,
        left: isLeft ? 80 : null, // Conditionally set left
        right: !isLeft ? 80 : null, // Conditionally set right
        child: Image.asset('assets/triangle.png', width: 35),
      ),
      Container(
        width: 280,
        decoration: BoxDecoration(
          color: const Color(0xff7870DE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.2,
                color: Color.fromARGB(255, 248, 248, 248),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget WawaTalking(String description, String imageName, String secondImage) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SpeechBubble(description, false),
      const SizedBox(height: 20),
      Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(imageName, height: 150),
          Positioned(
            right: -25,
            top: 25,
            child: Image.asset(secondImage, width: 50)
          ),
        ],
      ),
    ],
  );
}

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
                    Provider.of<ProgressProvider>(context, listen: false).setSublevel(context,9);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Coin8Page9()),
                  );
              },
              child: Center(child: WawaTalking('Usually, you will encounter the concept of liabilities when borrowing money', "assets/wawaTalk.png", "assets/Unit 2/money_bag.png"))),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 8,
                      totalPages: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}