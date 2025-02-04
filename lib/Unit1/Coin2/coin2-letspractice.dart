import 'dart:math';
import 'package:flutter/material.dart';

class Coin2Prac extends StatelessWidget {
  const Coin2Prac({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ), // Decreased the height
              const Positioned(
                top: 30,
                child: Text(
                  'Let\'s' ' Put This into Practice!',
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
                  'assets/pigwalletthink.png',
                  width: min(MediaQuery.of(context).size.width * 0.8, 345),
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
    home: Coin2Prac(),
  ));
}
