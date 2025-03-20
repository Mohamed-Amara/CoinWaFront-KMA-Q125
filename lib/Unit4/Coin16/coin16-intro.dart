import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import './city-scroll-page.dart';

Widget SpeechBubble(String description, bool isLeft) {
  return Stack(
    clipBehavior: Clip.none, // Allow the triangle to overflow
    children: [
      Positioned(
        bottom: -30, // Lower the triangle for better alignment
        left: isLeft ? 120 : null, // Adjust position for larger size
        right: !isLeft ? 120 : null,
        child: Image.asset('assets/triangle.png', width: 70), // Larger triangle
      ),
      Container(
        width: double.infinity, // Use full width for consistent padding
        margin: const EdgeInsets.symmetric(
            horizontal: 40), // Add spacing from edges
        padding:
            const EdgeInsets.all(30), // Increased padding for better spacing
        decoration: BoxDecoration(
          color: const Color(0xff7870DE),
          borderRadius:
              BorderRadius.circular(40), // Increased rounding for larger size
        ),
        child: Center(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 1.5,
              color: Color.fromARGB(255, 248, 248, 248),
              fontSize: 50, // Larger font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

class Coin16Intro extends StatelessWidget {
  const Coin16Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CityScrollPage()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5), // Add padding from screen edges
                    child: SpeechBubble(
                        'Hmm....... I wonder what taxes are', true),
                  ),
                  const SizedBox(height: 20),
                  Image.asset('assets/wawatax.png',
                      width: 150), // Keep image size unchanged
                ],
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
                        totalPages: 6,
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
