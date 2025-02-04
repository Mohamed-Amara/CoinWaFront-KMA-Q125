import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-studquiz2.dart';
import 'package:provider/provider.dart';

class Coin13stuquiz extends StatefulWidget {
  final bool isRepeat;
  const Coin13stuquiz({super.key, required this.isRepeat});

  @override
  State<Coin13stuquiz> createState() => _Coin13Quiz1State();
}

class _Coin13Quiz1State extends State<Coin13stuquiz> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 5);
    }
    return QuizPageTemplate(question: "Can you guess what a student credit card is?", options: [QuizOption(description: " A high-interest card that requires a co-signer", isCorrect: false), QuizOption(description: "Is designed for students, offering a lower credit limit and rewards", isCorrect: true), QuizOption(description: " A debit card that only deducts money you have", isCorrect: false)], currentPage: 0, totalPages: 0, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin13stuquiz2(isRepeat: false)),
                );
     }, level: 13,
     );
  }
}