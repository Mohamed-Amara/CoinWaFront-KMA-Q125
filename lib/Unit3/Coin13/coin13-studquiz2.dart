
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-shuff.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-tempquiz.dart';

class Coin13stuquiz2 extends StatelessWidget {
  final bool isRepeat;
  const Coin13stuquiz2({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Coin13QuizTemplate(
      option1: ["Business Bob"], 
      option2: ["Regular Robby"], 
      option3: ["Studious Sam"],
      image1Path: 'assets/busbob.png',
      image2Path: 'assets/regrob.png',
      image3Path: 'assets/studsam.png',
      question: "Now, knowing what a Student credit card is, who do you think would likely use the card?", 
      correctOption: 3, 
      isRepeat: isRepeat, 
      route: Coin13shuffle(), currentPage: 0,);
  }
}
