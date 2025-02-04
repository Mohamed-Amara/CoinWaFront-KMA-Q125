import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-select.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin6Explain2 extends StatelessWidget {
  const Coin6Explain2({super.key});

  Widget SpeechBubble(String description, bool isLeft) {
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
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.2,
                color: Color.fromARGB(255, 248, 248, 248),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget WawaTalking(String description, String imageName) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SpeechBubble(description, false),
      const SizedBox(height: 20),
      Image.asset(imageName, width: 150),
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
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 2,
                        totalPages: 5,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                   if (Provider.of<ProgressProvider>(context, listen: false).level == 6) {
                    Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 3);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Coin6Select()),
                  );
                },
                child: Center(
                  child: WawaTalking(
                      'Value simply means how much something is worth! Usually in terms of money!',
                      "assets/Unit 2/wawaValue.png"),
                ),
              ),
            ],
          ),
        ));
  }
}
