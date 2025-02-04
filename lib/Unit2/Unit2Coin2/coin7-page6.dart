import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz1.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin7Page6 extends StatelessWidget {
  const Coin7Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              
              GestureDetector(
                onTap: () {
                  if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 5 && Provider.of<ProgressProvider>(context, listen: false).level == 7) {
                     Provider.of<ProgressProvider>(context,listen: false).setSublevel(context, 6);
                   }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Coin7Quiz1(isRepeat: false,)),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WawaTalking(
                          ' This would be a DEPRECIATING asset! In contrast, this asset is something you own that DECREASES in value over time.',
                          "assets/wawaTalk.png"),
                      const SizedBox(height: 20),
                      Image.asset('assets/spillmilk.png', width: 250),
                    ],
                  ),
                ),
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 5,
                        totalPages: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
