import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:provider/provider.dart';

class Coin14Quiz2 extends StatefulWidget {
  final bool isRepeat;
  const Coin14Quiz2({super.key, required this.isRepeat});

  @override
  State<Coin14Quiz2> createState() => _Coin14Quiz2State();
}

class _Coin14Quiz2State extends State<Coin14Quiz2> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 14) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 7);
    }
    return QuizPageTemplate(question: "Why should you borrow money from the bank with a credit card if you already have the money?", options: [QuizOption(description: "It allows you to save the money you already have and keep it for some other purchase", isCorrect: false), QuizOption(description: "You can slowly build up your credit score to have other benefits in the future", isCorrect: true), QuizOption(description: "You can decrease your credit score, allowing you to avoid interest payments in the future", isCorrect: false)], currentPage: 7, totalPages: 7, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoinAnimationScreen(coinNumber: 14, description: "How to Use a Credit Card")),
                );
     }, level: 14,
     );
  }
}