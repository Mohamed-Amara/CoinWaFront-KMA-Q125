import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditcard.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-folder.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin12creditright extends StatelessWidget {
  const Coin12creditright({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
           if (Provider.of<ProgressProvider>(context, listen: false)
                              .sublevel ==
                          6 &&
                      Provider.of<ProgressProvider>(context, listen: false)
                              .level ==
                          12) {
                    Provider.of<ProgressProvider>(context, listen: false)
                        .setSublevel(context, 7);
                  }
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin12folder()),
                );
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 241, 219),
          body: SafeArea(
            child: Stack(
              children: [
                // Purple container with bottom rounded corners
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: BottomRoundedClipper(),
                    child: Container(
                      color: Color(0xff5e18eb),
                      height: 550, 
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TopBar(
                                currentPage: 6,
                                totalPages: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'That\'s correct! Scores typically range from 300 to 900! 800 being one of the best!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/creditscore.png',
                              width: 430,
                            ),
                            const SizedBox(height: 75),
                            Image.asset(
                              'assets/wawaup.png',
                              width: 190,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ExitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.9, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void main() {
  runApp(const MaterialApp(
    home: Coin12creditright(),
  ));
}