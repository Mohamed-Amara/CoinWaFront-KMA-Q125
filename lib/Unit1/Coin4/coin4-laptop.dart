import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-interest.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

class Laptop extends StatefulWidget {
  const Laptop({super.key});

  @override
  State<Laptop> createState() => _LaptopState();
}

class _LaptopState extends State<Laptop> {
  String imagename = 'assets/Coin-4/desk_closed.png';
  double font_size = 30;
  bool isLaptopOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff7870de),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                      child: isLaptopOpen
                          ? RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'An ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: font_size,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'online savings account',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 232, 26),
                                      fontSize: font_size,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' with a bank is a safe, simple place to keep your money!\n\nThink of it like an ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: font_size,
                                      fontWeight: FontWeight.bold,
                                      
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'online piggy bank!',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 232, 26),
                                      fontSize: font_size,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              'Tap to open the laptop!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: font_size,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      font_size = 24;
                      imagename = 'assets/Coin-4/desk_open.png';
                      isLaptopOpen = true;
                    });
                  },
                  child: Image.asset(
                    imagename,
                    width: 300,
                  ),
                ),
                Visibility(
                  visible: isLaptopOpen,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Interest(),
                                ),
                              );
                      },
                      child: Text("Next"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xff7870de), // Text color
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Button padding
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ExitButton(),
          ],
        ),
      ),
    );
  }
}
