import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

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
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio Player instance

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
      _playCoinDropSound(); // Play sound when animation starts
      _controller.forward();
    });

    // Navigate to home after animation completes
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  Future<void> _playCoinDropSound() async {
    await _audioPlayer.play(AssetSource('sounds/coin_drop.mp3')); // Ensure you have this file in assets
  }

  Future<void> _triggerVibration() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 100); // Vibrate for 100ms
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double maxWidth = screenWidth > 600 ? 600 : screenWidth;

    double bounceBackFactor = screenHeight * 0.005;
    double fallEndPosition = screenHeight * 0.88;

    _coinFallAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: screenHeight * -0.14,
          end: fallEndPosition,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 80,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: fallEndPosition,
          end: fallEndPosition - bounceBackFactor,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
    ]).animate(_controller);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child:
            Image.asset('assets/welcome_background.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: screenHeight * 0.25,
            child: FadeTransition(
              opacity: _fadeInText,
              child: Image.asset('assets/welcome_to.png', width: maxWidth * 0.9),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset('assets/banky.png', width: maxWidth, fit: BoxFit.fitWidth),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              if (_controller.isCompleted) {
                _triggerVibration(); // Vibrate when animation completes
              }
              return Positioned(
                top: _coinFallAnimation.value,
                child:
                Image.asset('assets/dropCoin.png', width: 0.23 * maxWidth),
              );
            },
          ),
          Positioned(
            bottom: 0,
            child: Image.asset('assets/banky2.png', width: maxWidth, fit: BoxFit.fitWidth),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose(); // Dispose audio player
    super.dispose();
  }
}
