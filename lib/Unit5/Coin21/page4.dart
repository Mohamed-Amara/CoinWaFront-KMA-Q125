import 'package:flutter/material.dart';
import '../../Templates/Image-and-speech.dart';
import './page5.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeechPageTemplate(
      isLeft: false,
      imagePath: 'assets/Unit5/genewawapig.png',
      text: "Wait! Before you lock your money away, let me show you a better way to grow it. You have 3 wishes! Use them wisely to learn about Saving vs. Investing!",
      headerText: 'What is Investing',
      currentPage: 1,
      totalPages: 6,
      triImage: 'assets/Unit5/blue-triangle.png',
      nextPage: Page5(),
      speechColor: Color(0xff57beda),
      textSize: 20,
    );
  }

}