import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditenter.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-quiz2.dart';
import 'package:provider/provider.dart';

class Coin12Quiz1 extends StatefulWidget {
  final bool isRepeat;
  const Coin12Quiz1({super.key, required this.isRepeat});

  @override
  State<Coin12Quiz1> createState() => _Coin12Quiz1State();
}

class _Coin12Quiz1State extends State<Coin12Quiz1> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 12) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 4);
    }
    return QuizPageTemplate(question: "What do YOU think a credit score means?", options: [QuizOption(description: "A number that shows how trustworthy you are with money", isCorrect: true), QuizOption(description: "A number that shows if you are rich or not", isCorrect: false), QuizOption(description: "A number that signifies the amount of money you borrowed", isCorrect: false)], currentPage: 4, totalPages: 7, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin12creditenter()),
                );
     }, level: 12,
     );
  }
}