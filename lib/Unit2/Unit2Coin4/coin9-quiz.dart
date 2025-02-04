import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz2.dart';
import 'package:provider/provider.dart';

class Coin9Quiz1 extends StatelessWidget {
  final bool isRepeat;
  const Coin9Quiz1({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 7);
    }
    return Coin9QuizTemplate(
      option1: ["Has \$3 in liabilities", "John"], 
      option2: ["Has \$2 in liabilities", "Rebecca"], 
      question: "Both have \$4 in assets. Who has the higher net worth?", 
      isOption1Correct: false, 
      isRepeat: isRepeat, 
      route: Coin9Quiz2(isRepeat: false),);
  }
}
