import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-quiz-template.dart';
import 'package:provider/provider.dart';

class Coin9Quiz3 extends StatelessWidget {
  final bool isRepeat;
  const Coin9Quiz3({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 9);
    }
    return Coin9QuizTemplate(
      option1: const ["Has \$32 more in liabilities", "Ben"], 
      option2: const ["Has \$24 more in liabilities", "Fanum"], 
      question: "Both have \$8 in liabilities. Who has the higher net worth?", 
      isOption1Correct: false, 
      isRepeat: isRepeat, 
      route: const CoinAnimationScreen(coinNumber: 9, description: 'Net Worth'),);
  }
}
