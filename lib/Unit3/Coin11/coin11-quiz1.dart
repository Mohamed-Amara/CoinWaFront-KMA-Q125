import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:provider/provider.dart';

class Coin11Quiz1 extends StatefulWidget {
  final bool isRepeat;
  const Coin11Quiz1({super.key, required this.isRepeat});

  @override
  State<Coin11Quiz1> createState() => _Coin11Quiz1State();
}

class _Coin11Quiz1State extends State<Coin11Quiz1> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 5);
    }
    return QuizPageTemplate(question: "Now, what is Good Debt?", options: [QuizOption(description: "Debt that let's you buy goods (clothes, products, etc.)", isCorrect: false), QuizOption(description: "Debt that helps put you in a better position in the long run!", isCorrect: true), QuizOption(description: "Debt that is good enough to cover your expenses", isCorrect: false)], currentPage: 5, totalPages: 6, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin11Quiz2(isRepeat: false)),
                );
     }, level: 11,
     );
  }
}