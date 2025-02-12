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
        curve: const Interval(0.2, 0.6, curve: Curves.easeIn),
      ),
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
    double maxWidth = screenWidth > 600 ? 600 : screenWidth; // Limit max width for larger screens

    // Bounce effect: Less bounce on smaller screens
    double bounceBackFactor = screenHeight > 800 ? screenHeight * 0.07 : screenHeight * 0.005;

    // Coin fall position: Falls lower on all screens, especially on smaller ones
    double fallEndPosition = screenHeight > 800 ? screenHeight * 0.88 : screenHeight * 0.93;

    // Coin Fall Animation
    _coinFallAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: screenHeight * -0.14, // Start from above the screen
          end: fallEndPosition, // Falls down to adjusted position
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 80, // Falling weight
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: fallEndPosition,
          end: fallEndPosition - bounceBackFactor, // Slight bounce
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20, // Bounce weight
      ),
    ]).animate(_controller);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset('assets/welcome_background.png', fit: BoxFit.cover),
          ),

          // Welcome Text Animation
          Positioned(
            top: screenHeight * 0.25,
            child: FadeTransition(
              opacity: _fadeInText,
              child: Column(
                children: [
                  Image.asset('assets/welcome_to.png', width: maxWidth * 0.9),
                ],
              ),
            ),
          ),

          // Piggy Bank Image at Bottom
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/banky.png',
              width: maxWidth, // Full width but limited for larger screens
              fit: BoxFit.fitWidth,
            ),
          ),

          // Falling Coin Animation
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: _coinFallAnimation.value,
                child: Image.asset('assets/dropCoin.png', width: 0.23 * maxWidth),
              );
            },
          ),

          // Piggy Bank Stretched Across Bottom
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/banky2.png',
              width: maxWidth, // Full width but limited for larger screens
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
