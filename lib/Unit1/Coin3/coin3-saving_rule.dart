import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class SavingRule extends StatelessWidget {
  final String writing;
  final int num;

  const SavingRule({super.key, required this.writing, required this.num});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TopBar(
                          currentPage: (num == 1) ? 7 : 9,
                          totalPages: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (num == 1) {
                        if (Provider.of<ProgressProvider>(context, listen: false).level == 3){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 8);
                }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SavingGraph(
                              writing:
                                  'I can split the \$50 into the following categories',
                              imagestring: 'assets/Coin-3/piechart1.png',
                              num: 1,
                            ),
                          ),
                        );
                      } else {
                        if (Provider.of<ProgressProvider>(context, listen: false).level == 3){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 10);
                }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SavingGraph(
                                writing:
                                    'This is called the 50/30/20 budget rule and can help you achieve your saving goals!',
                                imagestring: 'assets/Coin-3/piechart2.png',
                                num: 2),
                          ),
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: WawaTalking(writing, 'assets/Coin-3/wawaGirl1.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SavingGraph extends StatelessWidget {
  final String writing;
  final String imagestring;
  final int num;

  const SavingGraph({
    super.key,
    required this.writing,
    required this.imagestring,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TopBar(
                          currentPage: (num == 1) ? 8 : 10,
                          totalPages: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (num == 1) {
                        if (Provider.of<ProgressProvider>(context, listen: false).level == 3){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 9);
                }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SavingRule(
                              writing:
                                  'This method works as I spend some and still leave some to save! But we can break it down further ...',
                              num: 2,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CoinApp(
                                coinNumber: 3,
                                description: 'Setting Saving Goals'),
                          ),
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Image.asset(imagestring, width: 300),
                        ),
                        Center(
                          child: WawaTalking(writing, 'assets/Coin-3/wawaGirl2.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
