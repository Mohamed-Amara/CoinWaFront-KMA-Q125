import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-select.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

class Coin2Intro extends StatelessWidget {
  const Coin2Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Coin2Select(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ExitButton(),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ), // Decreased the height
                   
                    Center(
                      child: Image.asset(
                        'assets/wawacoin2intro.png',
                        width: min(MediaQuery.of(context).size.width * 0.8, 345),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin2Intro(),
  ));
}
