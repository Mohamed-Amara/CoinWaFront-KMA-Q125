import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-shopping.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // First Row (Right Side)
                          Padding(
                            padding: const EdgeInsets.only(left: 130.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start, // Align to right
                              children: [
                                Stack(
                                  clipBehavior:
                                      Clip.none, // Allow the triangle to overflow
                                  children: [
                                    Positioned(
                                      bottom: -15,
                                      left: 30,
                                      child: Image.asset('assets/triangle.png',
                                          width: 35),
                                    ),
                                    Container(
                                      width: 250,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff7870DE),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Your parent sends you to the grocery store!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            height: 1.2,
                                            color: Color.fromARGB(
                                                255, 248, 248, 248),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Second Row (Left Side)
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.start, // Align to left
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Image.asset('assets/wawaTalk.png', width: 110),
                              ),
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TopBar(
                                    currentPage: 6,
                                    totalPages: 7,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xffAB7241),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xffEFBA89),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/Shopping_Icons/paper.png',
                                    width: 400,
                                  ),
                                ),
                                const Center(
                                    child: Text('- eggs\n-milk\n-water',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'handwriting',
                                          height: 1.2,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 50,
                                        )))
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text("These are the items you'll need to buy",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'handwriting',
                                height: 1.2,
                                color: Color(0xff6327DB),
                                fontSize: 60,
                              )),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              // Navigate to SecondScreen (replace with your actual screen)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ShopGame()),
                              );
                            },
                            child: const Text('Next'),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
