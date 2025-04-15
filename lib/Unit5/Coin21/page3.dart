import 'package:flutter/material.dart';
import '../../Templates/Image-and-speech.dart';
import './page4.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeechPageTemplate(
      isLeft: true,
      imagePath: 'assets/Unit5/wawathrowcoin.png',
      text: "Oh I know, I learned so much about saving, I’m gonna save this!",
      headerText: 'What is Investing',
      currentPage: 1,
      totalPages: 6,
      triImage: 'assets/trianglecut2.png',
      nextPage: Page4(),
    );
  }

}