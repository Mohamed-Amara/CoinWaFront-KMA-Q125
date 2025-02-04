import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:provider/provider.dart';

class Coin11Quiz2 extends StatefulWidget {
  final bool isRepeat;
  const Coin11Quiz2({super.key, required this.isRepeat});

  @override
  State<Coin11Quiz2> createState() => _Coin11Quiz2State();
}

class _Coin11Quiz2State extends State<Coin11Quiz2> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 6);
    }
    return QuizPageTemplate(question: "Now, what is Bad Debt?", options: [QuizOption(description: "Borrowed money that is used for purchasing a depreciating asset", isCorrect: true), QuizOption(description: " Debt that is used to pay off a very large amount of money", isCorrect: false), QuizOption(description: "Loans that are not enough to cover your expenses", isCorrect: false)], currentPage: 6, totalPages: 6, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoinAnimationScreen(coinNumber: 11, description: 'Good Debt vs Bad Debt',)),
                );
     }, level: 11,
     );
  }
}