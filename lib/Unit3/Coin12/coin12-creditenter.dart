import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content1.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditcard.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditright.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-creditwrong.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-intro.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin12creditenter extends StatelessWidget {
  const Coin12creditenter({super.key});

  @override
  Widget build(BuildContext context) {

 if (Provider.of<ProgressProvider>(context, listen: false).level == 12) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 5);
    }

    final TextEditingController _controller = TextEditingController();

    void _checkCreditScore() {
      final enteredNumber = int.tryParse(_controller.text);
      if (enteredNumber != null) {

         if (Provider.of<ProgressProvider>(context, listen: false)
                              .sublevel ==
                          5 &&
                      Provider.of<ProgressProvider>(context, listen: false)
                              .level ==
                          12) {
                    Provider.of<ProgressProvider>(context, listen: false)
                        .setSublevel(context, 6);
                  }

        if (enteredNumber >= 700 && enteredNumber <= 900) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Coin12creditright()), // Navigate to the "correct score" page
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Coin12creditwrong()), // Navigate to the "incorrect score" page
          );
        }
      }
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 241, 219),
          body: SafeArea(
            child: Stack(
              children: [
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
                                currentPage: 5,
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
                        'Now, enter a number you think would be a good credit score!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Stack(
                          alignment: Alignment.topCenter, // Align the input section slightly lower
                          children: [
                            Image.asset(
                              'assets/blankcreditscore.png',
                              width: 430,
                            ),
                            Positioned(
                              top: 110, // Adjust this value to move the input down
                              child: SizedBox(
                                width: 150,
                                child: TextField(
                                  controller: _controller,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Score',
                                  ),
                                  onSubmitted: (_) => _checkCreditScore(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 75),
                      Image.asset(
                        'assets/wawaup.png',
                        width: 190,
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
    home: Coin12creditenter(),
  ));
}
