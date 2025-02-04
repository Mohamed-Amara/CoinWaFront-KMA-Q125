import 'dart:math';
import 'package:flutter/material.dart'; //For flutter UI framework
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/lobby.dart';
import 'package:provider/provider.dart';
import 'dart:async'; //for Timer
import 'home_screen.dart'; //To go to the home_screen after animation is done

class SplashScreen extends StatefulWidget { //Stateful Widget because animation state must be managed
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  final List<String> coinImages = [
    'assets/coin_yellow.png', // Yellow coin
    'assets/coin_red.png',    // Red coin
    'assets/coin_green.png',  // Green coin
    'assets/coin_blue.png',   // Blue coin
    'assets/coin_sky.png',    // Sky coin
    'assets/coin_purple.png'  // Purple coin (should stop)
  ];
  late List<double> leftPositions;
  late List<double> sizes;
  double halfPiggySize = 0;

  @override
  void initState() {
    super.initState();
    _startSplashScreenTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controllers = [
      AnimationController(duration: const Duration(seconds: 8), vsync: this)..repeat(), // Yellow
      AnimationController(duration: const Duration(seconds: 6), vsync: this)..repeat(), // Red
      AnimationController(duration: const Duration(seconds: 4), vsync: this)..repeat(), // Green
      AnimationController(duration: const Duration(seconds: 7), vsync: this)..repeat(), // Blue
      AnimationController(duration: const Duration(seconds: 5), vsync: this)..repeat(), // Sky
      AnimationController(duration: const Duration(seconds: 1), vsync: this), // Purple
    ];

    double endPosition = MediaQuery.of(context).size.height;

    _animations = List.generate(_controllers.length, (index) {
      if (index == 5) {
        endPosition = MediaQuery.of(context).size.height * 0.85;
      }
      return Tween<double>(begin: -100, end: endPosition).animate(
        CurvedAnimation(
          parent: _controllers[index],
          curve: Curves.linear,
        ),
      );
    }).toList();

    for (int i = 0; i < _controllers.length; i++) {
      if (i != 5) { // All coins except the purple coin
        _controllers[i].addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controllers[i].reset();
            _controllers[i].forward();
          }
        });
        _controllers[i].forward();
      } else { // Purple only forward, no repeat
        _controllers[i].forward();
      }
    }

    // Fixed left positions
    leftPositions = [
      MediaQuery.of(context).size.width * 0.05, // Yellow coin farthest left
      MediaQuery.of(context).size.width * 0.2,  // Red coin right of the yellow coin
      MediaQuery.of(context).size.width * 0.2,  // Green coin same horizontal position as red coin
      MediaQuery.of(context).size.width * 0.8,  // Blue coin farthest right (partially off-screen)
      MediaQuery.of(context).size.width * 0.7,  // Sky coin a little left of the blue coin
      (MediaQuery.of(context).size.width - (min(MediaQuery.of(context).size.width * 0.95, 500))*0.2)/2,  // Purple coin in the middle
    ];

    sizes = [
      MediaQuery.of(context).size.width * 0.12, // Yellow
      MediaQuery.of(context).size.width * 0.2,  // Red
      MediaQuery.of(context).size.width * 0.22, // Green
      MediaQuery.of(context).size.width * 0.45, // Blue
      MediaQuery.of(context).size.width * 0.12, // Sky
      MediaQuery.of(context).size.width * 0.2   // Purple (will be adjusted dynamically)
    ];
  }

  _startSplashScreenTimer() {
    Timer(const Duration(seconds: 3), _navigateToHome);
  }

 void _navigateToHome() async {
  try {
    await Provider.of<ProfileProvider>(context, listen: false).fetchUserData(context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LobbyApp()));
  } catch (error) {
    print('Error fetching user data: $error');
    Navigator.pushReplacementNamed(context, '/home');
  }
}


  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0, // Position at the bottom of the screen
            left: 0,
            right: 0,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final halfPiggyWidth = min(screenWidth * 0.95, 500).toDouble();
                return Center(
                  child: Image.asset(
                    'assets/half_piggy.png',
                    width: halfPiggyWidth,
                  ),
                );
              },
            ),
          ),
          ...List.generate(6, (index) {
            return AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                double coinSize = sizes[index];
                if (index == 5) {
                  coinSize = min(screenWidth * 0.95, 500) * 0.2; // Make the purple coin size relative to the half_piggy image height
                }
                return Positioned(
                  top: _animations[index].value,
                  left: leftPositions[index],
                  child: Image.asset(
                    coinImages[index],
                    width: coinSize,
                    height: coinSize,
                  ),
                );
              },
            );
          }),
          Center(
            child: Image.asset(
              'assets/LogoText2.png', // Path to your logo image
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the size as needed
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SplashScreen(),
  ));
}
