import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin9Page5Intro extends StatelessWidget {
  const Coin9Page5Intro({super.key});

  Widget WawaTalking(String description, String imageName) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpeechBubbleYellow(description, false, ["value"]),
        const SizedBox(height: 20),
        Image.asset(imageName, height: 150),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    if (Provider.of<ProgressProvider>(context, listen: false)
                            .level ==
                        9) {
                      Provider.of<ProgressProvider>(context, listen: false)
                          .setSublevel(context, 4);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Coin9Page5(isRepeat: false,)),
                    );
                  },
                  child: WawaTalking(
                    "This is important to remember when considering net worth. Here's another example ...",
                    "assets/wawaTalk.png",
                  ),
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
                      totalPages: 10,
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
