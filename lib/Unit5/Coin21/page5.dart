import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit5/Coin21/three-icon-page.dart';
import '../../Templates/Image-and-speech.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeechPageTemplate(
      isLeft: false,
      imagePath: 'assets/wawaConfused.png',
      text: "Hmm, I didn’t know genies were real... but if one’s giving out wishes, I’m not gonna complain about it",
      headerText: 'What is Investing',
      currentPage: 1,
      totalPages: 6,
      triImage: 'assets/trianglecut2.png',
      nextPage: iconPage(),
    );
  }

}