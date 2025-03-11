import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

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


class Coin18Intro extends StatelessWidget {
  const Coin18Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const Coin11Page2()),
        // );
        print("hi");
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Text(
                      "To start off, let's first explore what debt is!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff5e17eb),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  SpeechBubble('Debt is when you owe something (usually money) to someone else!', true),
                  const SizedBox(height: 20),
                  SpeechBubble('It is money that is borrowed for a certain period of time and has to be returned', false),
                  const SizedBox(height: 20),
                  Image.asset('assets/wawaTalk.png', width: 150),
                ],
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
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