import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-Scene1.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin12folder extends StatefulWidget {
  const Coin12folder({super.key});

  @override
  State<Coin12folder> createState() => _SmartLearnState();
}

class _SmartLearnState extends State<Coin12folder> {
  List<SmartItemData> smartItems = [
    SmartItemData('1', ' Low interest rates on credit cards'),
    SmartItemData('2', 'Easier approval for renting homes'),
    SmartItemData('3', 'Better insurance rates'),
    SmartItemData('4', 'Higher chances of employment'),
    SmartItemData('5', 'More trustworthy to banks'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                const Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TopBar(
                          currentPage: 7,
                          totalPages: 7,
                        ),
                      ),
                    ),
                  ],
                ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Container(
                        width: 350,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff7870DE),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Below are some advantages to having a good/high credit score!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.2,
                                color: Color.fromARGB(255, 248, 248, 248),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipPath(
                          clipper: FlippedTriangleClipper(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: const Color(0xffcb9163),
                          ),
                        ),
                        Container(
                          width: 100,
                          color: const Color(0xffcb9163),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    color: const Color(0xffcb9163),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                          child: Image.asset(
                            'assets/Coin-3/tape.png',
                            width: 300,
                          ),
                        ),
                        Column(
                          children: smartItems.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.toggleAnimation();
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    AnimatedContainer(
                                      width: item.animatedWidth,
                                      height: 50,
                          
                                      duration: const Duration(milliseconds: 500),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xfffff1db),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          item.textTitle,
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff8383E6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          item.name,
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                             if (Provider.of<ProgressProvider>(context, listen: false).level == 3){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 4);
                }
                             Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CoinAnimationScreen(coinNumber: 12, description: "What is A Credit Card?")
                                        ),
                                      ); 
                            },
                            child: const Text("What's Next?"),
                          ),
                        )
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
    );
  }
}

class SmartItemData {
  String name;
  String description;
  late double animatedWidth;
  late String textTitle;

  SmartItemData(this.name, this.description) {
    animatedWidth = 100;
    textTitle = "";
  }

  void toggleAnimation() {
    animatedWidth = animatedWidth == 100 ? 350 : 100;
    textTitle = textTitle == "" ? description : "";
  }
}

class FlippedTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void main() {
  runApp(const MaterialApp(
    home: Coin12folder(),
  ));
}
