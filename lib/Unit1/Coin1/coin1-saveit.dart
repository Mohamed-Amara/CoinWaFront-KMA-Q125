import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-whatISsaving.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';

class CoinSave extends StatelessWidget {
  const CoinSave({super.key});

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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Wawa-wonderful!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 61, 250),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'You SAVED to spend \nit at a later time...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 120, 112, 222),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/pigdollarsave.png',
                      width: 350
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.31,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Choosing to Pocket it for Later is an example of SAVING',
                                    style: TextStyle(
                                      fontFamily: 'Source',
                                      fontSize: min(MediaQuery.of(context).size.width * 0.085, 50),
                                      color: const Color.fromARGB(255, 255, 241, 219),
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
                ],
              ),
            ),
            ExitButton()
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CoinSave(),
  ));
}
