import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-magic.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class Coin13intro extends StatelessWidget {
  const Coin13intro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Coin13magic(),
            ),
          );
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 241, 219),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ), // Decreased the height
                      const Positioned(
                        top: 10,
                        child: Text(
                          'Before We Start...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                         SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/wawasign.png',
                          width: min(MediaQuery.of(context).size.width * 1, 345),
                        ),
                      ),
                    ],
                  ),
                  ExitButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin13intro(),
  ));
}
