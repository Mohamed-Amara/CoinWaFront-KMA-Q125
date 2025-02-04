import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page5.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin7Page4 extends StatelessWidget {
  const Coin7Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              
              GestureDetector(
                onTap: () {
                  if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 3 && Provider.of<ProgressProvider>(context, listen: false).level == 7) {
                     Provider.of<ProgressProvider>(context,listen: false).setSublevel(context, 4);
                   }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Coin7Page5()),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WawaTalking(
                          'An appreciating asset is something you own that INCREASES in value. The examples below got more valuable over time!',
                          "assets/wawaTalk.png"),
                          SizedBox(height:50),
                     Image.asset('assets/assetchart.png', width: 340),
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
                        currentPage: 3,
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
