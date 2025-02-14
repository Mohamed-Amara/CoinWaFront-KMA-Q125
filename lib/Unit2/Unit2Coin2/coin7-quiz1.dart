import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';

class Coin7Quiz1 extends StatelessWidget {
  final bool isRepeat;
  const Coin7Quiz1({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Coin7QuizTemplate(
      option1: ["Young Plant"], 
      option2: ["Ice Cream Cone"], 
      image1Path: 'assets/yplant.png',
      image2Path: 'assets/icecream.png',
      question: "Now, which is an example of an appreciating asset?", 
      isOption1Correct: true, 
      isRepeat: isRepeat, 
      route: Coin7Quiz2(isRepeat: false), currentPage: 6,);
  }
}
