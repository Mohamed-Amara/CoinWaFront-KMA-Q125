import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login-Logout/Hello2.dart';
import 'package:flutter_application_1/Login-Logout/login2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          // Define breakpoints for responsiveness
          double maxWidth = screenWidth > 1200
              ? 800 // Desktop max width
              : screenWidth > 600
              ? 500 // Tablet max width
              : screenWidth; // Default for phones

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/welcome_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/Welcome_to_1.png',
                  width: maxWidth * 0.5,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/coinwa_big_pig.png',
                  width: maxWidth, // Make it full width but limited for large screens
                  height: screenHeight * 0.45, // Adjust height proportionally
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login2App()),
                          );
                        },
                        child: Image.asset(
                          'assets/login-removebg-preview.png',
                          width: maxWidth * 0.7,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => hello()),
                          );
                        },
                        child: Image.asset(
                          'assets/Frame_34276-removebg-preview.png',
                          width: maxWidth * 0.7,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
