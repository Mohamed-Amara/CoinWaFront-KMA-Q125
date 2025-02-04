import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-quiz2.dart';
import 'package:provider/provider.dart';

class Coin14Quiz1 extends StatefulWidget {
  final bool isRepeat;
  const Coin14Quiz1({super.key, required this.isRepeat});

  @override
  State<Coin14Quiz1> createState() => _Coin14Quiz1State();
}

class _Coin14Quiz1State extends State<Coin14Quiz1> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 14) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 6);
    }
    return QuizPageTemplate(question: "What are the benefits of paying your credit card back on-time?", options: [QuizOption(description: "You will have to pay interest on the money you borrowed", isCorrect: false), QuizOption(description: "Your credit score will go down", isCorrect: false), QuizOption(description: "You don't have to pay interest on the money you borrowed using your credit card", isCorrect: true)], currentPage: 6, totalPages: 7, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin14Quiz2(isRepeat: false)),
                );
     }, level: 14,
     );
  }
}