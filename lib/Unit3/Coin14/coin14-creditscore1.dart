import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-folder.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-goback.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin14CreditScore1 extends StatelessWidget {
  const Coin14CreditScore1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (Provider.of<ProgressProvider>(context, listen: false).level == 14) {
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 3);
                }
               
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin14GoBack()),
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
                      color: const Color(0xff5e18eb),
                      height: 550, 
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TopBar(
                                currentPage: 2,
                                totalPages: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Although paying by cash is a great option, it does not build your credit score!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Unit 3/credit_score_600.png',
                              width: 350,
                            ),
                            const SizedBox(height: 100),
                            Image.asset(
                              'assets/wawaup.png',
                              width: 200,
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
    home: Coin14CreditScore1(),
  ));
}