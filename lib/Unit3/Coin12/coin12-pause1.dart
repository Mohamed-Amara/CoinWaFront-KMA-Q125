import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-pause2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'dart:math' as math;
import 'package:flutter_application_1/Templates/topbar.dart';

class Coin12pause1 extends StatelessWidget {
  const Coin12pause1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Coin12pause2()),
            );
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 35),
                        Text(
                          'What is a Credit Card?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 90),
                        Container(
                          width: double.infinity,
                          height: 400,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                right: -70,
                                top: 330,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Transform.rotate(
                                      angle: math.pi / 4,
                                      child: Container(
                                        width: 270,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: const Color(0xff5e17eb),
                                        ),
                                      ),
                                    ),
                                  Positioned(
                                      bottom: 110,
                                      left: -130,
                                      child: Image.asset(
                                        'assets/cardexplain.png',
                                        width: 300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 2,
                        totalPages: 7,
                      ),
                    ),
                  ),
                ],
              ),
              // The greyed-out overlay
              Container(
                color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
              ),
              // Pause image in the center
              Center(
                child: Image.asset(
                  'assets/pause.png',
                  width: 150, // Adjust the size as needed
                ),
              ),
              // What is Interest image at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    'assets/whatisinterest.png',
                    width: 300, // Adjust the size as needed
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
