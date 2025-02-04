import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page4.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin7Page3 extends StatelessWidget {
  const Coin7Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                   if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 2 && Provider.of<ProgressProvider>(context, listen: false).level == 7) {
                     Provider.of<ProgressProvider>(context,listen: false).setSublevel(context, 3);
                   }
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Coin7Page4()),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WawaTalking(
                          'If you picked the egg or the house, Congratulations! These would be APPRECIATING assets!',
                          "assets/wawaTalk.png"),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                                             Image.asset('assets/Unit 2/dragonegg.png', width: 140),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 120.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/blackhouse.png', width: 120),
                            
                          ],
                        ),
                      ),
                      
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
                        currentPage: 2,
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
