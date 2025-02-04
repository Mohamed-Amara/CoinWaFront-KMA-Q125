import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-explain-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz.dart';

class Coin9Page6Explain extends StatelessWidget {
  const Coin9Page6Explain({super.key});

  @override
  Widget build(BuildContext context) {
    return Coin9TemplateExplain(description: "Fancy pig has a negative net worth. If someone has a negative or net worth of 0, they usually go bankrupt! This means they are unable to pay back liabilities!", imagename: 'assets/hammer.png', numerical: "", route: Coin9Quiz1(isRepeat: false,), sublevel: 6,);
  }
}