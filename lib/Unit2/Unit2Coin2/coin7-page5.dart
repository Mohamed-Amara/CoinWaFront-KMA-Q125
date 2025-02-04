import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page6.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin7Page5 extends StatelessWidget {
  const Coin7Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
           if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 4 && Provider.of<ProgressProvider>(context, listen: false).level == 7) {
                     Provider.of<ProgressProvider>(context,listen: false).setSublevel(context, 5);
                   }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Coin7Page6(),
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
                      
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ), // Decreased the height
                      const Positioned(
                        top: 30,
                        child: Text(
                          'Now...\nWhat if you picked the milk?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize
                              .min, 
                          children: [
                            Image.asset(
                              'assets/wawaConfused.png',
                              width: min(
                                  MediaQuery.of(context).size.width * 0.8, 145),
                            ),
                            Image.asset(
                              'assets/cartonmilk.png',
                              width: 120
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ExitButton(),
                  const Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TopBar(
                                currentPage: 4,
                                totalPages: 9,
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
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin7Page5(),
  ));
}
