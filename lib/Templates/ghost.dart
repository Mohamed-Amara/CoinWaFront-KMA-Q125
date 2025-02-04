import 'package:flutter/material.dart';
import 'package:flutter_application_1/lobby.dart';

class Ghost extends StatelessWidget {
  const Ghost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE2817A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0),
            Container(
              height: 100,
              color:  const Color.fromARGB(255, 255, 241, 219), // Change this to the desired color
              
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0),
            Center(
              child: Image.asset(
                'assets/wawaghost.png', // Path to your image
                width: MediaQuery.of(context).size.width * 1,
                fit: BoxFit.fill, // Fill the available space // Set width to screen width
              ),
            ),
            const SizedBox(height: 20), // Add spacing between image and buttons
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
                          'WATCH \nAD!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
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
                      top: 30,
                      child: IconButton(
                        icon: const Text(
                          'GO \nHOME!',
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
                              builder: (context) => const LobbyPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 0), // Add spacing between buttons and images
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Ghost(),
  ));
}
