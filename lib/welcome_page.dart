import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInText;
  late Animation<double> _coinFallAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _fadeInText = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.6, curve: Curves.easeIn)),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });

    // Navigate to home after animation completes
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Move coin fall animation here to use screenHeight correctly
    _coinFallAnimation =
        Tween<double>(begin: screenHeight * -.115, end: screenHeight * 0.82)
            .animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.8,
              curve: Curves.easeOutBack)), // Coin falls with bounce
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background layers
          Positioned.fill(
            child:
                Image.asset('assets/welcome_background.png', fit: BoxFit.cover),
          ),
          // Positioned.fill(
          //   child: Image.asset('assets/Ellipse_64.png', fit: BoxFit.cover),
          // ),
          // Positioned.fill(
          //   child: Image.asset('assets/Ellipse_64_1.png', fit: BoxFit.cover),
          // ),
          // Positioned.fill(
          //   child: Image.asset('assets/Ellipse_65.png', fit: BoxFit.cover),
          // ),

          // Welcome Text Animation
          Positioned(
            top: 200,
            child: FadeTransition(
              opacity: _fadeInText,
              child: Column(
                children: [
                  Image.asset('assets/welcome_to.png',
                      width: screenWidth * 0.9),
                  // SizedBox(height: 10),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/banky.png',
              width: screenWidth, // Full width
              fit: BoxFit.fitWidth,
            ),
          ),

          // Falling Coin Animation
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: _coinFallAnimation.value,
                child: Image.asset('assets/dropCoin.png',
                    width: 0.23 * screenWidth),
              );
            },
          ),

          // Piggy Bank Stretched Across Bottom
          Positioned(
            // height: screenHeight,
            bottom: 0,
            child: Image.asset(
              'assets/banky2.png',
              width: screenWidth, // Full width
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
