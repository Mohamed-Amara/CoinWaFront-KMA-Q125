import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';

class Coin7Quiz3 extends StatelessWidget {
  final bool isRepeat;
  const Coin7Quiz3({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Coin7QuizTemplate(
      option1: ["Small Car"], 
      option2: ["Rare Art"], 
      image1Path: 'assets/smallcar.png',
      image2Path: 'assets/painting.png',
      question: "Now, which is an example of an appreciating asset?", 
      isOption1Correct: false, 
      isRepeat: isRepeat, 
      route: Coin7Quiz4(isRepeat: false), currentPage: 8,);
  }
}
