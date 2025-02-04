import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditcard.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stanquiz.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class Coin13stan extends StatelessWidget {
  const Coin13stan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Coin13stanquiz(isRepeat: false,),
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
                  
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ), // Decreased the height
                      const Positioned(
                        top: 0,
                        child: Text(
                          'YOUR CARD IS...\n\nThe Standard Card!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/creditcardintro.png',
                              width: 400,
                            ),
                            Image.asset(
                              'assets/magichat.png',
                              width: 350,
                            ),
                          ],
                        ),
                      )
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
    home: Coin13stan(),
  ));
}
