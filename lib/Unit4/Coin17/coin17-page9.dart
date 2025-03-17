import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page10.dart';

// ignore: non_constant_identifier_names
Widget SpeechBubble(String description, bool isLeft) {
  return Stack(
    clipBehavior: Clip.none, // Allow the triangle to overflow
    children: [
      Positioned(
        bottom: -15,
        left: isLeft ? 80 : null, // Conditionally set left
        right: !isLeft ? 80 : null, // Conditionally set right
        child: Image.asset('assets/richtextriangle.png', width: 35),
      ),
      Container(
        width: 320,
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
                fontSize: 30,
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

class Coin17Page9 extends StatelessWidget {
  const Coin17Page9({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures taps are detected anywhere
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaxBracketGame()),
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 10,
                    child: Image.asset(
                      'assets/moneyrain.png', // Replace with your background image
                      width: 400,
                      fit: BoxFit.contain, // Ensures it covers the area
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "So let me get this straight… I owe money for making money? If I stop making money, do they pay me??",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.transparent,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      SpeechBubble(
                          'Thats all the time I have, my businesses need my attention!! Goodbye for now WaWa. Good luck on your Journey!',
                          false),
                      const SizedBox(height: 20),
                      Image.asset('assets/richwawahandmoney.png',
                          height: 340, fit: BoxFit.contain),
                    ],
                  ),
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
