import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin18/coin18-page12.dart';

class Coin18Page11 extends StatelessWidget {
  const Coin18Page11({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageSize = screenWidth * 0.8; // Dynamically scale the treasure map

    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures taps are detected anywhere
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Coin18Page12_()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              // Top section with title and character
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 15,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: screenWidth,
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
                    width: screenWidth,
                    height: 180,
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
                        Image.asset(
                          'assets/wondering_detective_wawa.png',
                          width: 130,
                        ),
                        const SizedBox(width: 10),
                        const Flexible(
                          child: Text(
                            "Deduction Hunt",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Source",
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // Center Content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight*0.22),
                  // Background Box for the Text
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 140, 82, 255),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Find the Hidden Tax Deductions, Click to Begin!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Treasure Map Image
                  Image.asset(
                    'assets/treasure_map.png',
                    width: imageSize, // Dynamically scales based on screen size
                  ),
                ],
              ),

              ExitButton(),
              const Align(
                alignment: Alignment.topRight,
                child: TopBar(
                  currentPage: 11,
                  totalPages: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
