import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-page5.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin8Page4 extends StatelessWidget {
  const Coin8Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                 if (Provider.of<ProgressProvider>(context, listen: false).level == 8) {
                    Provider.of<ProgressProvider>(context, listen: false).setSublevel(context,5);
                  }
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Coin8Page5()),
                  );
              },
              child: Center(child: WawaTalking('Now, a liability is something you owe someone! Usually, in terms of money!', "assets/wawaTalk.png"))),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 4,
                      totalPages: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}