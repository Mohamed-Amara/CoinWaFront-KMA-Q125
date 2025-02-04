import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz3.dart';
import 'package:provider/provider.dart';

class Coin9Quiz2 extends StatelessWidget {
  final bool isRepeat;
  const Coin9Quiz2({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 8);
    }
    return Coin9QuizTemplate(
      option1: ["Has \$6 in assets", "Quandale"], 
      option2: ["Has \$2 in assets", "Bart"], 
      question: "Both have \$6 in liabilities. Who has the higher net worth?", 
      isOption1Correct: true, 
      isRepeat: isRepeat, 
      route: Coin9Quiz3(isRepeat: false),);
  }
}
