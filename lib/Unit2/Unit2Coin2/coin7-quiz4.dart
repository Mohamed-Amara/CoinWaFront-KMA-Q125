import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';

class Coin7Quiz4 extends StatelessWidget {
  final bool isRepeat;
  const Coin7Quiz4({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Coin7QuizTemplate(
      option1: const ["Smartphone"], 
      option2: const ["Rare Art"], 
      image1Path: 'assets/smartphone.png',
      image2Path: 'assets/rarecoin.png',
      question: "Now, which is an example of a depreciating asset?", 
      isOption1Correct: true, 
      isRepeat: isRepeat, 
      route: const CoinAnimationScreen(coinNumber: 7, description: 'depreciating/appreciating assets'), currentPage: 9,);
  }
}
