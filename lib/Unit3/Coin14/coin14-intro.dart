import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

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
        width: 320,
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

class Coin14Intro extends StatelessWidget {
  const Coin14Intro({super.key});

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
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
                }
               
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin14Page2()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "Looks like Wawa is buying some movie tickets",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff5e17eb),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    const SizedBox(height: 100),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset('assets/Unit 3/cashier.png', width: 350),
                        Positioned(
                          top: -70,
                          right: 0,
                          child: SpeechBubble("That will be \$24.99", true)
                        ),
                        Positioned(
                          bottom: -40,
                          left: 40,
                          child: Image.asset('assets/Unit 3/wawaMovie.png', width: 200)
                        )
                      ],
                    )                   
                ],
              )
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
