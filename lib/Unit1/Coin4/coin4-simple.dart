// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-compounding.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

Widget TopPart() {
  return Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xff7870DE),
    ),
    child: const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Text(
          'Simple Interest',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.5,
            color: Color.fromARGB(255, 248, 248, 248),
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

void main() {
  runApp(const Simple());
}

class Simple extends StatelessWidget {
  const Simple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InterestExplanation(),
    );
  }
}

class InterestExplanation extends StatefulWidget {
  const InterestExplanation({Key? key}) : super(key: key);

  @override
  _InterestExplanationState createState() => _InterestExplanationState();
}

class _InterestExplanationState extends State<InterestExplanation> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaf6ff),
      body: GestureDetector(
        onTap: () {
          if (_pageController.page!.toInt() < 4) {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn);
          }
        },
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            InterestIntro(),
            Page1(),
            Page2(
              thirdPage: false,
            ),
            Page3(),
            Compounding()
          ],
        ),
      ),
    );
  }
}

class InterestIntro extends StatelessWidget {
  const InterestIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            Center(
                child: WawaTalking(
                    "let's quickly explore two types of interest! Simple interest and compounding interest!",
                    'assets/Coin-4/wawaJar1.png')),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopPart(),
                const SizedBox(height: 100),
                SpeechBubble(
                    "Let's say you put \$10,000 in a savings account", false),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Image.asset(
                      'assets/wawaTalk.png',
                      width: 120,
                    ),
                  ),
                ]),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Column(
                    children: [
                      Stack(children: [
                        Image(
                            image: AssetImage('assets/Coin-4/money_jar.png'),
                            height: 200),
                        Positioned(
                          top: 80,
                          left: 35,
                          child: Text(
                            '\$10,000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2f008d),
                            ),
                          ),
                        )
                      ]),
                      const SizedBox(height: 30),
                      Text(
                        '4% Simple Interest per year',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff2f008d),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
    );
  }
}

class Page2 extends StatelessWidget {
  final bool thirdPage;
  const Page2({Key? key, required this.thirdPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String money_added = '+\$400';
    String calculation = "10,000 x 0.04 = 400";

    return SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Column(
                    children: [
                      TopPart(),
                      const SizedBox(height: 20),
                      SpeechBubble(
                          "Every year, you would have 4% of \$10,000 added to your account",
                          true),
                      Center(
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Image.asset(
                              'assets/wawaTalk.png',
                              width: 120,
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff5E18EB),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Stack(clipBehavior: Clip.none, children: [
                                  Text(
                                    calculation,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xfffecd1a),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Positioned(
                                    top: -40,
                                    left: 90,
                                    child: Text(
                                      '4%',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Color(0xff2f008d)),
                                    ),
                                  )
                                ]),
                              )),
                        ]),
                      ),
                    ],
                  )),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'YEAR 1 \n +\$400',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xff2f008d)),
                                  ),
                                  Image.asset('assets/Coin-4/cash.png', width: 70)
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    'YEAR 2 \n +\$400',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xff2f008d)),
                                  ),
                                  Image.asset('assets/Coin-4/cash.png', width: 70)
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    'YEAR 3 \n +\$400',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xff2f008d)),
                                  ),
                                  Image.asset('assets/Coin-4/cash.png', width: 70)
                                ],
                              ),
                              const SizedBox(width: 20),
                              Text(
                                    '...',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 80,
                                        color: Color(0xff2f008d)),
                                  ),
                            ],
                          ),
                        ),
                        Stack(clipBehavior: Clip.none, children: [
                          const Image(
                              image: AssetImage('assets/Coin-4/money_jar.png'),
                              height: 200),
                          Positioned(
                            top: 80,
                            left: 35,
                            child: const Text(
                                    '\$10,000',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff2f008d),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                          ),
                        ]),
                        const SizedBox(height: 20),
                        const Text(
                          '4% Simple Interest per year',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff2f008d),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: WawaTalking(
                  "Now, let's explore compounding interest",
                  'assets/Coin-4/wawaJar2.png'),
            ),
            ExitButton(),
          ],
        ),
      ),
    );
  }
}

Widget SpeechBubble(String description, bool isLeft) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        bottom: -15,
        left: isLeft ? 80 : null,
        right: !isLeft ? 80 : null,
        child: Image.asset('assets/triangle.png', width: 35),
      ),
      Container(
        width: 300,
        decoration: BoxDecoration(
          color: const Color(0xff7870DE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.2,
                color: Color.fromARGB(255, 248, 248, 248),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
