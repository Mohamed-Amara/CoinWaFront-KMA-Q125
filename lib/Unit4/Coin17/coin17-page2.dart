import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page3.dart';
import 'package:flutter_application_1/Unit4/Coin17/speech-bubble.dart';

class Coin17Page2 extends StatelessWidget {
  const Coin17Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures taps are detected anywhere
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin17Page3()),
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
                          'assets/coin17headercash.png',
                          width: 130, // Increased size for better balance
                        ),
                        const SizedBox(
                            width: 10), // Space between image and text
                        Flexible(
                          child: Text(
                            "What is Income Tax",
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
                  const SizedBox(height: 60),
                  SpeechBubble(
                      'Hey, I’m Rich WaWa. See, once you get rich like me, you have to pay a LOT of Taxes.',
                      true),
                  const SizedBox(height: 30),
                  Image.asset('assets/richwawa.png',
                      width: 300, fit: BoxFit.contain),
                ],
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 2,
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
