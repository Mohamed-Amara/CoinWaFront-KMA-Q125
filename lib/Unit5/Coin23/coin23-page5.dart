import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';
import 'package:flutter_application_1/Unit5/Coin23/coin23-page6.dart';

class coin23Page5 extends StatefulWidget {
  const coin23Page5({super.key});

  @override
  State<coin23Page5> createState() => coin23Page5State();
}

class coin23Page5State extends State<coin23Page5> {
  bool button1Pressed = false;
  bool button2Pressed = false;
  bool button3Pressed = false;

  bool get _allButtonsPressed =>
      button1Pressed && button2Pressed && button3Pressed;

  void _showPopup(
      BuildContext context, String title, String description, String icon) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/wawaup.png',
                      width: (MediaQuery.of(context).size.width * 0.25)
                          .clamp(0, 150),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      icon,
                      width: (MediaQuery.of(context).size.width * 0.25)
                          .clamp(0, 150),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TypingText(
                  text: description,
                  textAlign: TextAlign.center,
                  animationSpeed: const Duration(milliseconds: 5000),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2f008d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => coin23Page3()),
        // );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 15,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180, // Increased height for more space
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 91, 24, 233),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180, // Increased height for better alignment
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 140, 82, 255),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                "The Stock Market",
                                softWrap:
                                    true, // Allows text to wrap to the next line
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32, // Increased font size
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Source",
                                  height:
                                      1.3, // Adjust line height for better readability
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  TypingText(
                    text: "Click the buttons to repair \nthe space shuttle!",
                    textAlign: TextAlign.center,
                    animationSpeed: const Duration(milliseconds: 3000),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      height: 1.5,
                      fontFamily: "Source",
                    ),
                  ),

                  SizedBox(height: 15),

                  // Center image
                  Image.asset(
                    'assets/Unit5/shuttle2.png', // Update with correct path + extension
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.contain,
                  ),

                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Button 1
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            button1Pressed = true;
                          });
                          _showPopup(
                            context,
                            'Fuel',
                            'The Rocket uses the investors money as fuel to reach space! The more people invest, the higher the rocket flies and increases the value of stock!',
                            'assets/Unit5/fuel.png',
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Color(0xFF7870DE),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/Unit5/fuel.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),

                      // Button 2
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            button2Pressed = true;
                          });
                          _showPopup(
                            context,
                            'Branding',
                            'The company Logo helps attract investors, allowing the company to grow and sell more stocks. ',
                            'assets/Unit5/companylogo.png',
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Color(0xFF7870DE),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/Unit5/companylogo.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),

                      // Button 3
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            button3Pressed = true;
                          });
                          _showPopup(
                            context,
                            'Seats',
                            'The number of seats determines how many people can come along on your rocket! More seats means more potential investors, but also more potential risk!',
                            'assets/Unit5/seat.png',
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Color(0xFF7870DE),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/Unit5/seat.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  if (_allButtonsPressed)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 66, 0, 141),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => coin23Page6()),
                        );
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Source",
                        ),
                      ),
                    ),
                ],
              ),
              // Exit button
              ExitButton(),

              // TopBar (right corner)
              TopBar(
                currentPage: 5,
                totalPages: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
