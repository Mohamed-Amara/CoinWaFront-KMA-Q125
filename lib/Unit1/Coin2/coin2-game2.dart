import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CatchingGameApp());
}

class CatchingGameApp extends StatelessWidget {
  const CatchingGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Catching Game',
      home: CatchingGameScreen(),
    );
  }
}

class CatchingGameScreen extends StatefulWidget {
  const CatchingGameScreen({super.key});

  @override
  _CatchingGameScreenState createState() => _CatchingGameScreenState();
}

class _CatchingGameScreenState extends State<CatchingGameScreen> {
  final Random _random = Random();
  late double _handPosition;
  late Timer _spawnTimer;
  late Timer _updateTimer;
  late Timer _gameTimer; // Timer for the game duration
  final List<FallingObject> _fallingObjects = [];
  int _score = 0;
  int _gameDurationSeconds = 30; // 2 minutes

  @override
  void initState() {
    super.initState();
    _handPosition = 0.5;
    _spawnTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _spawnObject();
    });
    _updateTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      _updateObjects();
    });

    // Start the game timer
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_gameDurationSeconds > 0) {
          _gameDurationSeconds--;
        } else {
          _gameTimer.cancel(); // Stop the timer when time is up
          _navigateToScoreScreen();
        }
      });
    });
  }

  @override
  void dispose() {
    _spawnTimer.cancel();
    _updateTimer.cancel();
    _gameTimer.cancel();
    super.dispose();
  }

  void _spawnObject() {
    setState(() {
      bool isNeed = _random.nextBool();
      String type = isNeed ? _getRandomNeedType() : _getRandomWantType();
      _fallingObjects.add(FallingObject(
        isNeed: isNeed,
        type: type,
        startPosition: _random.nextDouble(),
        id: UniqueKey(),
      ));
    });
  }

  void _updateObjects() {
    final height = MediaQuery.of(context).size.height;
    List<FallingObject> objectsToRemove = [];

    setState(() {
      for (var object in _fallingObjects) {
        object.top += 5;
        if (object.top > height * 0.85 &&
            (object.startPosition - _handPosition).abs() < 0.1) {
          _catchObject(object);
          objectsToRemove.add(object);
        }
      }
      _fallingObjects.removeWhere((object) => object.top > height);
    });

    // Remove objects outside the setState to avoid ConcurrentModificationError
    for (var object in objectsToRemove) {
      _fallingObjects.remove(object);
    }
  }

  void _catchObject(FallingObject object) {
    setState(() {
      if (object.isNeed) {
        _score++;
      } else {
        _score--;
      }
    });
  }

  void _navigateToScoreScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(score: _score),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String timerText =
        '${_gameDurationSeconds ~/ 60}:${(_gameDurationSeconds % 60).toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  
                  Container(
                    width: 500,
                    padding:
                        const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 120, 112, 222),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Catch Needs! Avoid Wants!',
                       textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.9,
              left: MediaQuery.of(context).size.width * _handPosition,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _handPosition +=
                        details.delta.dx / MediaQuery.of(context).size.width;
                    _handPosition = _handPosition.clamp(0.0, 0.9);
                  });
                },
                child: Image.asset(
                  'assets/openhands.png',
                  width: 100,
                ),
              ),
            ),
            ..._fallingObjects.map((object) {
              return Positioned(
                top: object.top,
                left: MediaQuery.of(context).size.width * object.startPosition,
                child: Image.asset(
                  _getImagePath(object),
                  width: 50,
                ),
              );
            }),
            Positioned(
              top: 170,
              left: 20,
              child: Text(
                'Score: $_score',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 170,
              right: 20,
              child: Text(
                'Time: $timerText',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ExitButton(),
          ],
        ),
      ),
    );
  }

  String _getImagePath(FallingObject object) {
    if (object.isNeed) {
      switch (object.type) {
        case 'food':
          return 'assets/eggs.png';
        case 'water':
          return 'assets/water.png';
        case 'milk':
          return 'assets/milk.png';
        default:
          return 'assets/toothbrush.png';
      }
    } else {
      switch (object.type) {
        case 'game':
          return 'assets/game.png';
        case 'purse':
          return 'assets/purse.png';
        case 'applewatch':
          return 'assets/applewatch.png';
        default:
          return 'assets/smartphone.png';
      }
    }
  }

  String _getRandomNeedType() {
    int randomNumber = _random.nextInt(3);
    switch (randomNumber) {
      case 0:
        return 'food';
      case 1:
        return 'water';
      case 2:
        return 'milk';
      default:
        return 'food';
    }
  }

  String _getRandomWantType() {
    int randomNumber = _random.nextInt(3);
    switch (randomNumber) {
      case 0:
        return 'game';
      case 1:
        return 'purse';
      case 2:
        return 'applewatch';
      default:
        return 'game';
    }
  }
}

class FallingObject {
  final bool isNeed;
  final String type;
  final double startPosition;
  final Key id;
  double top = 0;

  FallingObject({
    required this.isNeed,
    required this.type,
    required this.startPosition,
    required this.id,
  });
}

class ScoreScreen extends StatelessWidget {
  final int score;

  const ScoreScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TopBar(
                                currentPage: 6,
                                totalPages: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Image.asset(
                          'assets/suprisedwawa.png', // Ensure this path is correct
                          width: 250,
                          height: 250,
                        ),
                        const Text(
                          'Your Final Score:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          '$score',
                          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CoinApp(
                                      coinNumber: 2, description: 'Benefits of Saving')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 120, 112, 222), // Text color
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Source', // Use the custom font here if needed
                            ),
                          ),
                          child: const Text('Continue!',
                              style: TextStyle(
                                fontFamily: 'Source',
                                color: Color.fromARGB(255, 255, 241, 219),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
