import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page7.dart';

// ignore: non_constant_identifier_names
Widget SpeechBubble(String description) {
  return Stack(
    clipBehavior: Clip.none, // Allow the triangle to overflow
    children: [
      Positioned(
        right: -15,
        top: 30,
        child: Transform.rotate(
          angle: -90 * (3.1415926535 / 180), // Convert degrees to radians
          child: Image.asset('assets/richtextriangle.png', width: 35),
        ),
      ),
      Container(
        height: 200,
        width: 235,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 87, 87, 87),
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
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class Coin17Page6 extends StatelessWidget {
  const Coin17Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures taps are detected anywhere
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin17Page7()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 15,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180, // Increased height for more space
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 91, 24, 233),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180, // Increased height for better alignment
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 140, 82, 255),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image beside the text
                        Image.asset(
                          'assets/income.png',
                          width: 130, // Increased size for better balance
                        ),
                        const SizedBox(
                            width: 10), // Space between image and text
                        Flexible(
                          child: Text(
                            "Who pays Income Tax?",
                            softWrap:
                                true, // Allows text to wrap to the next line
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32, // Increased font size
                              fontWeight: FontWeight.bold,
                              fontFamily: "Source",
                              height:
                                  1.3, // Adjust line height for better readability
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 225),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 12.5),
                        SpeechBubble(
                            'Silly WaWa, of Course! Everyone who makes money pays income tax. Its only Fair!'),
                        const SizedBox(width: 10),
                        Image.asset('assets/richwawa.png', width: 150),
                      ]),
                  Image.asset('assets/taxhitlist.png',
                      width: 370, fit: BoxFit.contain)
                ],
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 3,
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
