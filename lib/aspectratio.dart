import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/friend_provider.dart';
import 'package:flutter_application_1/Providers/leader_provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Login-Logout/login2.dart';
import 'package:flutter_application_1/Login-Logout/home_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/lives_provider.dart';
import 'welcome_page.dart';

class AspectRatioScreen extends StatelessWidget {
  const AspectRatioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/welcome_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: const Text(
                        "Please reload the app on a mobile device in vertical orientation.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30, // Increased font size
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/yellingwawa.png',
                      width: MediaQuery.of(context).size.height * 0.3,
                    ), // Dynamically sized image
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
