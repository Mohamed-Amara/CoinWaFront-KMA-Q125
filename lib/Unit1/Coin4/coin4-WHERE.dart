import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-bookshelf.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-piggyshake.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

class Coin4Where extends StatelessWidget {
  const Coin4Where({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Bookshelf(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ), // Decreased the height
                    const Positioned(
                      top: 10,
                      child: Text(
                        'Now that you know HOW to save...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 112, 222),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ), // Decreased the height
                    const Positioned(
                      top: 30,
                      child: Text(
                        'WHERE do you put your savings?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 112, 222),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/wheresave.png',
                        width: min(MediaQuery.of(context).size.width * 0.8, 345),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin4Where(),
  ));
}
