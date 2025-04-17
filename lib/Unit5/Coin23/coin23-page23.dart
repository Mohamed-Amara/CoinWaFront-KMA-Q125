import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';
import 'package:flutter_application_1/Unit5/Coin23/coin23-page24.dart';

Widget SpeechBubble(String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 375,
          ),
          child: Container(
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 122, 112, 219), //rgb(132, 26, 38)
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source'),
            ),
          ),
        ),
      ],
    ),
  );
}

class coin23Page23 extends StatelessWidget {
  const coin23Page23({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              bottom: 400,
              left: 20,
              right: 20,
              child: Image.asset('assets/Unit5/stock2.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.contain),
            ),

            // Question
            Positioned(
              bottom: 190,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Event
                  SpeechBubble(
                    'New Product Release!',
                  ),

                  const SizedBox(height: 15),

                  //Text
                  Text(
                    'Is now a good time to invest?',
                    style: const TextStyle(
                      height: 1.4,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source',
                    ),
                  ),

                  SizedBox(height: 15),

                  //Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //ButtonYes
                      SizedBox(
                        width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 76, 194, 68)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Correct ✅! Loading...')),
                            );
                            await Future.delayed(Duration(seconds: 2));
                            Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                  builder: (context) => coin23Page24()),
                            );
                          },
                          child: const Text("Yes",
                              style: TextStyle(
                                color: Color.fromARGB(
                                    255, 13, 68, 7), //rgb(13, 68, 7)
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Source",
                              )),
                        ),
                      ),
                      const SizedBox(width: 20),

                      //ButtonNo
                      SizedBox(
                        width: 130,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 185, 65, 65)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Incorrect ❌! Loading...')),
                            );
                            await Future.delayed(Duration(seconds: 2));
                            Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                  builder: (context) => coin23Page24()),
                            );
                          },
                          child: const Text("No",
                              style: TextStyle(
                                color: Color.fromARGB(
                                    255, 68, 13, 7), //rgb(68, 13, 7)
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Source",
                              )),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  )
                ],
              ),
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
                currentPage: 23,
                totalPages: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
