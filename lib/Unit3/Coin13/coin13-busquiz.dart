import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz2.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-busquiz2.dart';
import 'package:provider/provider.dart';

class Coin13busquiz extends StatefulWidget {
  final bool isRepeat;
  const Coin13busquiz({super.key, required this.isRepeat});

  @override
  State<Coin13busquiz> createState() => _Coin13Quiz2State();
}

class _Coin13Quiz2State extends State<Coin13busquiz> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 5);
    }
    return QuizPageTemplate(question: "Can you guess what a business credit card is?", options: [QuizOption(description: "A card that gives employees access to a company’s bank account", isCorrect: false), QuizOption(description: "A card that only works for personal expenses ", isCorrect: false), QuizOption(description: "A card  designed for business expenses, offering features like rewards for business-related purchases.", isCorrect: true)], currentPage: 0, totalPages: 0, isRepeat: widget.isRepeat,
     onNextPage: (){
      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin13busquiz2(isRepeat: false)),
                );
     }, level: 13,
     );
  }
}