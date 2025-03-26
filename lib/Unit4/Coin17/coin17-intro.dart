import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page2.dart';
import 'package:flutter_application_1/Unit4/Coin17/speech-bubble.dart';

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
                      'So let me get this straight… I owe money for making money? If I stop making money, do they pay me?',
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
                        totalPages: 13,
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
