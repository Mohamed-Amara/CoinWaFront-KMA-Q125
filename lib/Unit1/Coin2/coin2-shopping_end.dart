import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-game2.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';

class ShopEnd extends StatelessWidget {
  final double savedAmount;

  const ShopEnd({super.key, required this.savedAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            GestureDetector(
              onTap: () {
                if (Provider.of<ProgressProvider>(context, listen: false).level == 2){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 7);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatchingGameApp(),
                  ),
                );
                
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Stack(
                        clipBehavior: Clip.none, // Allow the triangle to overflow
                        children: [
                          Positioned(
                            bottom: -15,
                            left: 30,
                            child: Image.asset('assets/triangle.png', width: 35),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xff7870DE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'You Saved:\n\$${savedAmount.toStringAsFixed(2)}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  height: 1.5,
                                  color: Color.fromARGB(255, 248, 248, 248),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/Shopping_Icons/shoppingsave.png',
                      width: 250,
                    ),
                    const Spacer(),
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Color(0xff7870DE),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          "In the best case scenario, you should've saved:\n\$12.08",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.5,
                            color: Color.fromARGB(255, 248, 248, 248),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
