import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-saveit.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-spendit.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
// Import the utility file

class Scene1 extends StatelessWidget {
  const Scene1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TopBar(
                            currentPage: 1,
                            totalPages: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Say ...',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7870DE),
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20), // Add spacing from the left
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 80.0),
                                child: SpeechBubble('You receive \$10 for\ndoing your homework ...', true),
                              ),
                              const SizedBox(height: 30),
                              Image.asset("assets/wawaTalk.png", width: 150),
                              SizedBox(height: 40),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff7870DE),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Text("Do you ...", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      'assets/flatcoin.png',
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    onPressed: () {
                                      // Add your onPressed logic here
                                    },
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 40,
                                  child: IconButton(
                                    icon: const Text(
                                      'SPEND \nIT!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const CoinSpend(),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                          const SizedBox(width: 20), // Add spacing between buttons
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      'assets/flatcoin.png',
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    onPressed: () {
                                      // Add your onPressed logic here
                                    },
                                  ),
                                ],
                              ),
                              Positioned(
                                  top: 40,
                                  child: IconButton(
                                    icon: const Text(
                                      'POCKET \nIT!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const CoinSave(),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ], // Add a closing square bracket here
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 0), // Add spacing between buttons and images
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/smalldollar.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 145), // Add spacing between images
                      Image.asset(
                        'assets/smallpig.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ], // Add a closing square bracket here
              ),
              ExitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scene1(),
  ));
}
