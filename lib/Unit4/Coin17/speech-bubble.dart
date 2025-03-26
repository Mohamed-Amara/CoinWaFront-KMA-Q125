import 'package:flutter/material.dart';
import '../../Templates/typing_text.dart';


class SpeechBubble extends StatelessWidget {
  final String description;
  final bool isLeft;

  const SpeechBubble(this.description, this.isLeft, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -15,
          left: isLeft ? 80 : null,
          right: !isLeft ? 80 : null,
          child: Image.asset('assets/richtextriangle.png', width: 35),
        ),
        Container(
          width: 320,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 87, 87, 87),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: TypingText(
                text: description,
                animationSpeed: const Duration(milliseconds: 5000),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.2,
                  color: Color.fromARGB(255, 248, 248, 248),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
