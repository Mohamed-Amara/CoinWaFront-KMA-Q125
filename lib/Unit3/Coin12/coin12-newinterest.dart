import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-compounding.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-simple.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-bad.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-interestredo3.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

class Coin12interest4 extends StatefulWidget {
  const Coin12interest4({super.key});

  @override
  State<Coin12interest4> createState() => _InterestState();
}

class _InterestState extends State<Coin12interest4> {
  double boxWidth1 = 50;
  double boxWidth2 = 50;
  double boxWidth3 = 50;
  bool showImage1 = false;
  bool showImage2 = false;
  bool showImage3 = false;
  String text1 = '1';
  String text2 = '2';
  String text3 = '3';

  void toggleBox1() {
    setState(() {
      text1 = text1 == '1' ? '1st Year' : '1';
      boxWidth1 = boxWidth1 == 50 ? 200 : 50;
      showImage1 = !showImage1;
    });
  }

  void toggleBox2() {
    setState(() {
      text2 = text2 == '2' ? '2nd Year' : '2';
      boxWidth2 = boxWidth2 == 50 ? 200 : 50;
      showImage2 = !showImage2;
    });
  }

  void toggleBox3() {
    setState(() {
      text3 = text3 == '3' ? '3rd Year' : '3';
      boxWidth3 = boxWidth3 == 50 ? 200 : 50;
      showImage3 = !showImage3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 84, 55),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, right: 30, left: 30, bottom: 20),
                  child: Text(
                    'The BORROWED money from a credit card  (that you have to pay back) grows over time from interest!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 255, 241, 219),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Changed from center to start
                      children: [
                       
                      
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0), // Added padding to move text up
                          child: Text(
                            'Tap each tab below ...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:   Color.fromARGB(255, 194, 52, 52),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,), // Reduced height of the spacer
                        Row(
                          children: [
                            GestureDetector(
                              onTap: toggleBox1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 40.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: boxWidth1,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 194, 52, 52),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      text1,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (showImage1)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Image.asset(
                                  'assets/Coin-4/lego1.png',
                                  width: 140,
                                ),
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: toggleBox2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 40.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: boxWidth2,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 194, 52, 52),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        text2,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (showImage2)
                              Positioned(
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Image.asset(
                                    'assets/Coin-4/lego2.png',
                                    width: 140,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: toggleBox3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: boxWidth3,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 194, 52, 52),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      text3,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (showImage3)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Image.asset(
                                  'assets/Coin-4/lego3.png',
                                  width: 140,
                                ),
                              ),
                          ],
                        ),
                        if (showImage1 && showImage2 && showImage3)
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Coin12bad(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Tap to Continue',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'Interactive Tabs',
      home: Coin12interest4(),
    ),
  );
}
