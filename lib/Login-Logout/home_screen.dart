import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login-Logout/Hello2.dart';
import 'package:flutter_application_1/Login-Logout/login2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
              width: screenWidth * 0.5,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/logo2.png',
              width: screenWidth * 0.6,
              height: screenHeight * 0.25,
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
                      width: screenWidth * 0.7,
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
                      'assets/create_account-removebg-preview.png',
                      width: screenWidth * 0.7,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
