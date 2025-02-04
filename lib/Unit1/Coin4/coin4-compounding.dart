// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-graph.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

Widget TopPart() {
  return SafeArea(
    child: Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff7870DE),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Text(
                'Compounding \n Interest',
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
        ),
        ExitButton()
      ],
    ),
  );
}

void main() {
  runApp(const Compounding());
}

class Compounding extends StatelessWidget {
  const Compounding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compounding Interest',
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
      backgroundColor: const Color(0xffffe8fd),
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
            Page1(),
            Page2(
              thirdPage: false,
            ),
            Page2(
              thirdPage: true,
            ),
            Page3(),
            SavingsAccountPage()
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopPart(),
            const SizedBox(height: 100),
            SpeechBubble("Let's say you put \$10,000 in a savings account", true),
            Row( mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(height: 30),
                  Text(
                    '4% compounding Interest per year',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
    );
  }
}

class Page2 extends StatelessWidget {
  final bool thirdPage;
  const Page2({Key? key, required this.thirdPage}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    String money_added = thirdPage ? '+\$416' : '+\$400';
    String calculation =
        thirdPage ? "10,400 x 0.04 = 416" : "10,000 x 0.04 = 400";

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Column(
            children: [
              TopPart(),
              const SizedBox(height: 20),
              !thirdPage
                  ? SpeechBubble(
                      "After 1 year, you would have 4% of \$10,000 added to your account",
                      true)
                  : SpeechBubble(
                      "Say 2 years pass. THIS time, you would have 4% of \$10,400 added to your account",
                      true),
              Center(
                child: Row( mainAxisAlignment: MainAxisAlignment.center, children: [
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
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  const Image(
                      image: AssetImage('assets/Coin-4/money_jar.png'),
                      height: 200),
                  Positioned(
                    top: 80,
                    left: 35,
                    child: !thirdPage
                        ? const Text(
                            '\$10,000',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            '\$10,400',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  Positioned(
                    top: -100,
                    right: -80,
                    child: Column(
                      children: [
                        Text(
                          money_added,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xff2f008d)),
                        ),
                        Image.asset(
                          'assets/Coin-4/money_arrow.png',
                          width: 150,
                        )
                      ],
                    ),
                  )
                ]),
                const SizedBox(height: 30),
                const Text(
                  '4% compounding Interest per year',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: WawaTalking(
                'You gained an extra \$16 for that year! This might not seem like a lot, but it adds up the more you compound',
                'assets/Coin-4/wawaCash.png'),
          ),
          ExitButton()
        ],
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
