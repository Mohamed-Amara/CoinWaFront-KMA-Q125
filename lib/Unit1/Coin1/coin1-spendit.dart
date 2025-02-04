import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-whatISsaving.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';

class CoinSpend extends StatelessWidget {
  const CoinSpend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: GestureDetector(
        onTap: () {
          if (Provider.of<ProgressProvider>(context, listen: false).level == 1){
            Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
          }
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SavingQ(),
            ),
          );
        },
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.36,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 229, 215, 227), // Change color as needed
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Whoa! Slow down there...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20, // Adjust the position as needed
                      child: Center(
                        child: Image.asset(
                          'assets/pigdollarfly.png',
                          width:
                              min(MediaQuery.of(context).size.width * 0.98, 400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center vertically
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.31,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical: MediaQuery.of(context).size.height * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 120, 112, 222),
                              borderRadius: BorderRadius.circular(40),
                              border: const Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 58, 61, 250),
                                  width: 7.0,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // Center vertically
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                    
                                    children: [
                                      TextSpan(
                                        text:
                                            'You chose to SPEND IT, which is the OPPOSITE of Saving',
                                        style: TextStyle(
                                          fontFamily: 'Source',
                                          fontSize: min( MediaQuery.of(context).size.width * 0.08, 50)
                                             ,
                                          color: const Color.fromARGB(
                                              255, 255, 241, 219),
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
                  ],
                ),
              ),
              ExitButton()
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CoinSpend(),
  ));
}
