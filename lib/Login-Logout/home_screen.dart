import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login-Logout/Hello2.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-bookshelf.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Leaderboards/leaderboard.dart';
import 'dart:math';

import 'package:flutter_application_1/Login-Logout/login2.dart'; // Import the dart:math library
// Import the login page

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold( 
   
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 30), // Adjust the top padding as needed
                Image.asset(
                  'assets/LogoText.png', // Path to your logo image
                  width: min(screenWidth * 0.5, 300), // Use the smaller of 80% screen width or the original image width
                ),
                const SizedBox(height: 30), // Reduced space between the images
                Image.asset(
                  'assets/logo2.png', // Path to your logo image
                  width: min(350, screenWidth * 0.8), // Use the smaller of 230 or 80% screen width
                  height: min(350, screenHeight * 0.3), // Adjust the size as needed, if height consideration is needed
                ),
                const SizedBox(height: 90), // Reduced space between the images and buttons
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  hello(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/get_started.png', // Path to your button image
                        width: min(screenWidth * 0.55, 400), // Use the smaller of 60% screen width or the original image width
                      ),
                    ),
                    const SizedBox(height: 20), // Space between the buttons
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login2App(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/Already.png', // Path to your button image
                        width: min(screenWidth * 0.7, 500), // Use the smaller of 80% screen width or the original image width
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Adjust the bottom padding as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
      ),
      body: const Center(
        child: Text('This is the Registration Screen'),
      ),
    );
  }
}
