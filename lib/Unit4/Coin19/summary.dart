import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

import '../../Templates/typing_text.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CoinApp(
              coinNumber: 19,
              description: 'Your Taxes',
            ),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🏷️ Header
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
                            height: 180,
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
                          height: 180,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 140, 82, 255),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Let's Take a Trip Down Tax Road",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Source",
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 80),

                    // ✅ Summary Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CoinApp(
                              coinNumber: 16,
                              description: 'What are Taxes?',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Let's summarize what you have learned",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 80),

                    // ✅ Cat and Speech Bubble
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end, // Align to bottom
                      children: [
                        // 🐱 Larger Cat Image
                        Image.asset(
                          'assets/corporatewawa.png',
                          width: 150, // Increased size
                          height: 150, // Increased size
                        ),
                        const SizedBox(width: 15),

                        // 💬 Speech Bubble
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 91, 24, 233),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TypingText(
                            text:'Yap yap yap',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Slightly larger font
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
                ExitButton(),
                const Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TopBar(
                          currentPage: 11,
                          totalPages:11,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
