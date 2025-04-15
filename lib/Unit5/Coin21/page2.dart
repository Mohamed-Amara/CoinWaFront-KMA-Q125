import 'package:flutter/material.dart';
import '../../Templates/Image-and-speech.dart';
import './page3.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeechPageTemplate(
      isLeft: false,
      imagePath: 'assets/Unit5/wawamoneyjar.png',
      text: "Nice! I made \$1000!, I wonder what should I do with all this money! I feel like Bill  Gates right now",
      headerText: 'What is Investing',
      currentPage: 1,
      totalPages: 6,
      triImage: 'assets/trianglecut2.png',
      nextPage: Page3(), // or null if no next
    );
  }

}