import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-bookshelf.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-parents.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';

class Coin4phoneTap extends StatelessWidget {
  const Coin4phoneTap({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 3) {
          Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 4);
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Bookshelf(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),

                  // New image added here
                  Center(
                    child: Image.asset(
                      'assets/phonedata.png',
                      width: min(MediaQuery.of(context).size.width * 0.8, 345),
                    ),
                  ),

                  Center(
                    child: Image.asset(
                      'assets/phonenoglow.png',
                      width: min(MediaQuery.of(context).size.width * 0.8, 345),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  'Here is an example!', // Replace with your desired text
                  style: TextStyle(
                    fontFamily: 'Source',
                    fontSize: 30,
                    color: Color.fromARGB(255, 120, 112, 222),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ExitButton(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin4phoneTap(),
  ));
}
