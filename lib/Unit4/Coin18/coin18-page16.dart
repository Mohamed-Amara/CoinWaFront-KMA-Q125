import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';

class Coin18Page16 extends StatelessWidget {
  const Coin18Page16({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CoinApp(
              coinNumber: 18,
              description: 'Tax Deductions',
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
                          "Wrapping Up: Taxes & Deductions",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
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
                            coinNumber: 19,
                            description: 'Your Taxes',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "I'm ready for the next adventure!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ✅ Cat and Speech Bubble
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/corporatewawa.png',
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 122, 72, 230),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TypingText(
                          text:
                              'Awesome job, Wawa! You now know what taxes are, what counts as a deduction, and why it’s smart to keep those receipts. Filing taxes might sound scary, but with the right tools and knowledge, it’s totally doable. Keep learning and saving smart!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          softWrap: true,
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
                        currentPage: 16,
                        totalPages: 16,
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
