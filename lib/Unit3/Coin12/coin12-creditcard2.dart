import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiz1.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

import 'coin12-cardexplain.dart';


class Coin12card2 extends StatelessWidget {
  const Coin12card2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures the entire screen is tappable
      onTap: () {
        if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 1 &&
            Provider.of<ProgressProvider>(context, listen: false).level == 12) {
          Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Coin12explain(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/cutecard.png', width: 370),
                    const SizedBox(height: 50),
                    WawaTalking(
                      'They’re not all that scary, and I’ll help you see that!',
                      "assets/wawaTalk.png",
                    ),
                  ],
                ),
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
                        totalPages: 7,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
