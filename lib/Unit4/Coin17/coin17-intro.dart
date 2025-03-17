import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page2.dart';

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
          borderRadius: BorderRadius.circular(50),
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
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source'),
            ),
          ),
        ),
      ),
    ],
  );
}

class Coin17Intro extends StatelessWidget {
  const Coin17Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin17Page2()),
        );
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
                      "So let me get this straight… I owe money for making money? If I stop making money, do they pay me??",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.transparent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SpeechBubble(
                      'So let me get this straight… I owe money for making money? If I stop making money, do they pay me??',
                      true),
                  const SizedBox(height: 20),
                  Image.asset('assets/wawaConfused.png', width: 300),
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
