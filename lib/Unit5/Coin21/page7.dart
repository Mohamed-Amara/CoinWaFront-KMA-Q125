import 'package:flutter/material.dart';
import '../../Templates/Image-and-speech.dart';
import './linear-graph.dart';

class Page7 extends StatelessWidget {
  const Page7({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeechPageTemplate(
      isLeft: false,
      imagePath: 'assets/wawaConfused.png',
      text: "Obviously I shouldn’t spend it right now! I don’t know about investing and saving though!",
      headerText: 'What is Investing',
      currentPage: 1,
      totalPages: 6,
      triImage: 'assets/trianglecut2.png',
      nextPage: SavingScreen(),
    );
  }

}