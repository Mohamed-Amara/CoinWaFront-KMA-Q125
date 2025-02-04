import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stanquiz2.dart';
import 'package:provider/provider.dart';

class Coin13stanquiz extends StatefulWidget {
  final bool isRepeat;
  const Coin13stanquiz({super.key, required this.isRepeat});

  @override
  State<Coin13stanquiz> createState() => _Coin13Quiz3State();
}

class _Coin13Quiz3State extends State<Coin13stanquiz> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 5);
    }
    return QuizPageTemplate(question: "Can you guess what a standard credit card is?", options: [QuizOption(description: " A card that lets you borrow money and pay it back later, often with interest", isCorrect: true), QuizOption(description: "A card that only allows you to spend money you already have in your bank account", isCorrect: false), QuizOption(description: "A card that must be loaded with money before you can use it, like a prepaid card", isCorrect: true)], currentPage: 0, totalPages: 0, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin13stanquiz2(isRepeat: false)),
                );
     }, level: 13,
     );
  }
}