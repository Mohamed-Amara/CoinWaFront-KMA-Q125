import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

Widget SpeechBubbleYellow(
      String description, bool isLeft, List<String> highlightWords) {
    // Split the description into words
    List<TextSpan> textSpans = [];
    List<String> words = description.split(' ');

    for (String word in words) {
      // Check if the word should be highlighted
      bool shouldHighlight = highlightWords.contains(word);
      textSpans.add(
        TextSpan(
          text: '$word ',
          style: TextStyle(
            color: shouldHighlight
                ? Color(0xfff5be4e)
                : const Color.fromARGB(255, 248, 248, 248),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none, // Allow the triangle to overflow
      children: [
        Positioned(
          bottom: -15,
          left: isLeft ? 80 : null, // Conditionally set left
          right: !isLeft ? 80 : null, // Conditionally set right
          child: Image.asset('assets/triangle.png', width: 35),
        ),
        Container(
          width: 280,
          decoration: BoxDecoration(
            color: const Color(0xff7870DE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: textSpans,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

class Coin9Page2 extends StatelessWidget {
  const Coin9Page2({super.key});

  

  Widget WawaTalking(String description, String imageName) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpeechBubbleYellow(description, false, ["net", "worth"]),
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

                    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
                                         Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 3);
                                      }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Coin9Page3Part1()),
                    );
                  },
                  child: WawaTalking(
                    "Now, a common misconception is that net worth means how much money someone makes yearly!",
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
                      currentPage: 2,
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
