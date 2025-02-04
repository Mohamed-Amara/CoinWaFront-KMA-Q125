import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz3.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-2tempquiz.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-Scene3.dart';

class Coin13scene2 extends StatelessWidget {
  final bool isRepeat;
  const Coin13scene2({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return Coin13Quiz2Template(
      option1: ["Standard Card"], 
      option2: ["Student Card"], 
      image1Path: 'assets/creditcardintro.png',
      image2Path: 'assets/stucard.png',
      question: "You’re studying and looking for a credit card to start your credit score.", 
      isOption1Correct: false, 
      isRepeat: isRepeat, 
      route: Coin13scene3(isRepeat: false), currentPage: 5,);
  }
}
