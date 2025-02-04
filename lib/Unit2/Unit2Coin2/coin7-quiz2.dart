import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz3.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';

class Coin7Quiz2 extends StatelessWidget {
  final bool isRepeat;
  const Coin7Quiz2({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Coin7QuizTemplate(
      option1: ["Rare Trading Card"], 
      option2: ["Fresh Apple"], 
      image1Path: 'assets/tradingcard.png',
      image2Path: 'assets/apple.png',
      question: "Now, which is an example of a depreciating asset?", 
      isOption1Correct: false, 
      isRepeat: isRepeat, 
      route: Coin7Quiz3(isRepeat: false), currentPage: 7,);
  }
}
