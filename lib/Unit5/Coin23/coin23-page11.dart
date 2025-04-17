import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';
import 'package:flutter_application_1/Unit5/Coin23/coin23-page12.dart';

Widget SpeechBubble(String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -15,
          left: 60,
          child: Image.asset(
            'assets/Unit5/redtriangle.png',
            width: 30,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 375,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 132, 26, 38), //rgb(132, 26, 38)
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 32,
            ),
            child: TypingText(
              text: description,
              style: const TextStyle(
                  height: 1.4,
                  color: Color.fromARGB(255, 248, 248, 248),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source'),
            ),
          ),
        ),
      ],
    ),
  );
}

class coin23Page11 extends StatelessWidget {
  const coin23Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => coin23Page12()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              // Top banner
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Stack(
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
                          Flexible(
                            child: Text(
                              "The Stock Market",
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
              ),

              // Center image
              Positioned(
                bottom: 200,
                child: Image.asset('assets/Unit5/count2.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain),
              ),

              // Center(
              //   child: Image.asset('assets/Unit5/backseats.png',
              //       width: MediaQuery.of(context).size.width * 1.0,
              //       fit: BoxFit.contain),
              // ),

              // Speech bubble and genie
              Positioned(
                bottom: 105,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/Unit5/martianandwawa.png',
                      width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 2,
                child: Image.asset('assets/Unit5/bigseats.png',
                    width: MediaQuery.of(context).size.width * 1.0,
                    fit: BoxFit.contain),
              ),

              // Exit button
              Positioned(
                top: 10,
                left: 10,
                child: ExitButton(),
              ),

              // TopBar (right corner)
              const Positioned(
                top: 10,
                right: 10,
                child: TopBar(
                  currentPage: 11,
                  totalPages: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
