import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_1/Unit1/Coin3/coin3-sentencebuild.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class NotSmart extends StatefulWidget {
  const NotSmart({super.key});

  @override
  _NotSmartState createState() => _NotSmartState();
}

class _NotSmartState extends State<NotSmart> with SingleTickerProviderStateMixin {
  final int numberOfCoins = 6; // Number of coins to display
  final List<Offset> _coinOffsets = [];
  final List<double> _coinOpacities = [];
  final Random _random = Random();
  int _coinsTapped = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize coin positions and opacities
    for (int i = 0; i < numberOfCoins; i++) {
      _coinOffsets.add(Offset(_random.nextDouble() * 250, _random.nextDouble() * 400));
      _coinOpacities.add(1.0);
    }

    // Initialize animation controller and animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
    );

    // Stop the animation after a brief period
    Future.delayed(const Duration(seconds: 2), () {
      _controller.stop();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapCoin(int index) {
    setState(() {
      _coinOffsets[index] = const Offset(300, 0); // Change to desired position off the screen
      _coinOpacities[index] = 0.0; // Start fade out
      _coinsTapped++;
    });
  }

  void _onScreenTap() {
    if (_coinsTapped == numberOfCoins) {
     if (Provider.of<ProgressProvider>(context, listen: false).level == 3){
            Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 6);
          }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Coin3Build(isRepeat: false,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScreenTap,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: Stack(
            
            children: [
              ExitButton(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TopBar(
                              currentPage: 5,
                              totalPages: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(_animation.value, 0),
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/alarm.png', // Replace with your image asset path
                              height: 80, // Adjust height as needed
                              width: 80, // Adjust width as needed
                            ),
                          ),
                          const SizedBox(width: 20), // Adjust spacing between image and text
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 149, 10),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(30),
                              child: const Text(
                                'Wawa\'s goal is NOT SMART! It\'s not...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Source',
                                  fontSize: 25.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10), // Adjust height as needed
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Expanded(
                        child: Container(
                          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 200, // Adjust height as needed
            ),
                          color: const Color.fromARGB(255, 181, 180, 243),
                          padding: const EdgeInsets.all(20), // Add padding to the container
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'Source',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '- Specific:',
                                        style: TextStyle(color: Colors.black), // Green color for bullet point
                                      ),
                                      TextSpan(
                                        text: ' What kind of supercar? How much is it?\n\n',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: '- Measurable:',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' How will you track the progress?\n\n',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: '- Achievable:',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' An expensive supercar in the short-term is not realistic!\n\n',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: '- Relevant:',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' Why is it important to Wawa?\n\n',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: '- Timed:',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' “soon” - When? Tomorrow? In a month?',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Coins Layer
                              for (int i = 0; i < numberOfCoins; i++)
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 500),
                                  left: _coinOffsets[i].dx,
                                  top: _coinOffsets[i].dy,
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 500),
                                    opacity: _coinOpacities[i],
                                    child: GestureDetector(
                                      onTap: () => _onTapCoin(i),
                                      child: Image.asset(
                                        'assets/Tapcoin.png', // Replace with your coin image asset path
                                        height: 120, // Adjust height as needed
                                        width: 120, // Adjust width as needed
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        // Define your app's theme here
      ),
      home: const NotSmart(),
    ),
  );
}
