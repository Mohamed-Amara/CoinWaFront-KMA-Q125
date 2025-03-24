import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content3.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';

void main() {
  runApp(const Coin1Cont2());
}

class Coin1Cont2 extends StatefulWidget {
  const Coin1Cont2({super.key});

  @override
  _Coin1Cont2State createState() => _Coin1Cont2State();
}

class _Coin1Cont2State extends State<Coin1Cont2> {
  int slideIndex = 0;
  final List<String> slides = [
    "Let's say Yusef gets \$10 a week for allowance...(3/6)",
    "and he saves and pockets \$5 each week! (4/6)",
  ];

  void _nextSlide() {
    setState(() {
      if (slideIndex < slides.length - 1) {
        slideIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin1Cont3()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque, // Makes entire screen tappable
          onTap: _nextSlide,
          child: SafeArea(
            child: Stack(
              children: [
                ExitButton(),
                const Align(
                  alignment: Alignment.topRight,
                  child: TopBar(currentPage: 2, totalPages: 3),
                ),
                Column(
                  children: [
                    const SizedBox(height: 85),
                    Padding(
                      padding: const EdgeInsets.only(left: 56),
                      child: SpeechBubble(text: slides[slideIndex]),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Image.asset('assets/wawaTalk.png', width: 150),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/expaper.png',
                          width: min(MediaQuery.of(context).size.width, 450),
                        ),
                        Image.asset('assets/bike coinwa.png', width: 350),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpeechBubble extends StatelessWidget {
  final String text;
  const SpeechBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 120, 112, 222),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TypingText(text: text),
    );
  }
}

