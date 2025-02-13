import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';
import '../../Templates/topbar.dart'; // Ensure the import path is correct
import 'coin3-smart_game.dart';

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
      Image.asset(imageName, height: 150),
    ],
  );
}

class Coin3Intro extends StatelessWidget {
  const Coin3Intro({super.key});

  void _navigateToNext(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 3) {
      Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Smart(isRepeat: false)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures taps are detected anywhere on the screen
      onTap: () => _navigateToNext(context),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TopBar(
                            currentPage: 1,
                            totalPages: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: WawaTalking(
                        "Setting SMART saving goals is important to save money effectively!",
                        'assets/Coin-3/wawaCalendar.png',
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

void main() {
  runApp(const MaterialApp(
    home: Coin3Intro(),
  ));
}
