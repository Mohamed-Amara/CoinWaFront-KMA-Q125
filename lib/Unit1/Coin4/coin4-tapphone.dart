import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-phonetapped.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

class Coin4phone extends StatefulWidget {
  const Coin4phone({super.key});

  @override
  _Coin4phoneState createState() => _Coin4phoneState();
}

class _Coin4phoneState extends State<Coin4phone> with SingleTickerProviderStateMixin {
  bool _showTapText = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Coin4phoneTap(),
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Container(
                      height: 260,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color(0xff8483E4),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsets.all(40),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        onFinished: () {
                          setState(() {
                            _showTapText = true;
                          });
                        },
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'There are apps that help you save money digitally, making it easy to track savings and set goals.',
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                              fontFamily: 'Source',
                              fontSize: 25.5,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            speed: Duration(milliseconds: 50),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0, // Add space between the text and the image
                  ),
                  Center(
                    child: ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'assets/phoneglow.png',
                        width: min(MediaQuery.of(context).size.width * 0.8, 345),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0, // Add space between the text and the image
                  ),
                  if (_showTapText)
                    const Text(
                      'Tap The Phone!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 120, 112, 222),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
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
    home: Coin4phone(),
  ));
}
