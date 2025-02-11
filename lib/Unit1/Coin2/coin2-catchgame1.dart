import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-shopping_intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FallingCoins1());
}

class FallingCoins1 extends StatelessWidget {
  const FallingCoins1({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GameModel(),
        child: const MaterialApp(
          home: FallingCoinsGamePage(targetAmount: 5), // Default target amount
        ));
  }
}

class FallingCoinsGamePage extends StatefulWidget {
  final int targetAmount; // Target amount to save

  const FallingCoinsGamePage({super.key, required this.targetAmount});

  @override
  _FallingCoinsGamePageState createState() => _FallingCoinsGamePageState();
}

class _FallingCoinsGamePageState extends State<FallingCoinsGamePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<FallingItem> _fallingItems = []; // List to hold multiple falling items
  final List<String> coinImages = [
    'assets/flatcoin.png',
    'assets/hammer.png',
  ];
  bool _gameOver = false; // Track if the game is over

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              // Update the position of all falling items
              for (var item in _fallingItems) {
                item.fallDistance += 5; // Adjust fall speed here
                if (item.fallDistance > MediaQuery.of(context).size.height) {
                  if (isCoinCaught(item)) {
                    Provider.of<GameModel>(context, listen: false)
                        .adjustScore(item.imagePath);
                  }
                  resetItem(item);
                }
              }

              // Check if the target amount is reached
              if (Provider.of<GameModel>(context, listen: false).score >=
                  widget.targetAmount) {
                _gameOver = true;
                _controller.stop(); // Stop the animation
              }
            });
          });

    // Start the game loop
    startGame();
  }

  void startGame() {
    // Add a new item every 1 second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_gameOver && _fallingItems.length < 5) {
        // Limit to 5 items at a time
        setState(() {
          _fallingItems.add(FallingItem(
            leftPosition:
                Random().nextDouble() * MediaQuery.of(context).size.width,
            imagePath: coinImages[Random().nextInt(coinImages.length)],
          ));
        });
      }
    });

    _controller.repeat();
  }

  void resetItem(FallingItem item) {
    setState(() {
      item.leftPosition =
          Random().nextDouble() * MediaQuery.of(context).size.width;
      item.imagePath = coinImages[Random().nextInt(coinImages.length)];
      item.fallDistance = 0.0;
    });
  }

  bool isCoinCaught(FallingItem item) {
    double piggyBankPosition =
        Provider.of<GameModel>(context, listen: false).piggyBankPosition;
    double piggyBankLeft = (MediaQuery.of(context).size.width / 2) +
        (piggyBankPosition * (MediaQuery.of(context).size.width / 2)) -
        50; // Adjusted hitbox
    double piggyBankRight = piggyBankLeft + 150; // Adjusted hitbox
    return (item.leftPosition >= piggyBankLeft &&
        item.leftPosition <= piggyBankRight);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  decoration: BoxDecoration(
                    color: const Color(0xff8483E4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Save the Coins!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 5,
                      totalPages: 7,
                    ),
                  ),
                ),
              ],
            ),
            for (var item in _fallingItems)
              Positioned(
                top: item.fallDistance,
                left: item.leftPosition,
                child: GestureDetector(
                  onTap: () {
                    if (!_gameOver && isCoinCaught(item)) {
                      Provider.of<GameModel>(context, listen: false)
                          .adjustScore(item.imagePath);
                      resetItem(item);
                    }
                  },
                  child: Coin(imagePath: item.imagePath),
                ),
              ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: PiggyBank(),
            ),
            Positioned(
              top: 160,
              left: 20,
              child: Consumer<GameModel>(
                builder: (context, model, child) {
                  return Text('Amount: ${model.score}',
                      style:
                          const TextStyle(fontSize: 30, fontFamily: 'Source'));
                },
              ),
            ),
            Positioned(
              top: 60,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward,
                    color: Colors.white, size: 30),
                onPressed: () {
                  int score =
                      Provider.of<GameModel>(context, listen: false).score;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(score: score)),
                  );
                },
              ),
            ),
            Positioned(
              top: 90,
              child: ExitButton(),
            ),
            if (_gameOver)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'You saved enough!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FallingItem {
  double leftPosition;
  String imagePath;
  double fallDistance;

  FallingItem({
    required this.leftPosition,
    required this.imagePath,
    this.fallDistance = 0.0,
  });
}

class Coin extends StatelessWidget {
  final String imagePath;

  const Coin({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 100, // Increased size
      height: 100, // Increased size
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Center(
            child: Text(
              'Error: $exception',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

class PiggyBank extends StatelessWidget {
  const PiggyBank({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        Provider.of<GameModel>(context, listen: false)
            .movePiggyBank(details.primaryDelta!);
      },
      child: Consumer<GameModel>(
        builder: (context, model, child) {
          return Container(
            alignment: Alignment(model.piggyBankPosition, 1),
            child: Image.asset(
              'assets/half_piggy.png',
              width: 200, // Increased size
              height: 150, // Increased size
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Error: $exception',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class GameModel with ChangeNotifier {
  double _piggyBankPosition = 0.0;
  int _score = 0;

  double get piggyBankPosition => _piggyBankPosition;
  int get score => _score;

  void movePiggyBank(double delta) {
    _piggyBankPosition += delta / 100;
    if (_piggyBankPosition > 1.0) _piggyBankPosition = 1.0;
    if (_piggyBankPosition < -1.0) _piggyBankPosition = -1.0;
    notifyListeners();
  }

  void adjustScore(String coinImagePath) {
    if (coinImagePath == 'assets/flatcoin.png') {
      _score += 1;
    } else {
      _score -= 1;
    }
    notifyListeners();
  }
}

class SecondPage extends StatelessWidget {
  final int score;

  const SecondPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    String message;
    String imagePath;

    if (score >= 20) {
      message = "Congratulations! You saved for a smartphone!";
      imagePath = 'assets/smartphone.png';
    } else if (score >= 10) {
      message = "Congratulations! You saved for a notebook!";
      imagePath = 'assets/notebook.png';
    } else if (score >= 5) {
      message = "Congratulations! You saved for a toothbrush!";
      imagePath = 'assets/toothbrush.png';
    } else {
      message = "Keep Saving!";
      imagePath = '';
    }

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xff8483E4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                  fontSize: 24, fontFamily: 'Source', color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            imagePath.isNotEmpty
                ? Image.asset(
                    imagePath,
                    width: 200,
                    height: 200,
                  )
                : Container(),
            const SizedBox(height: 20),
            if (imagePath.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  if (Provider.of<ProgressProvider>(context, listen: false)
                          .level ==
                      2) {
                    Provider.of<ProgressProvider>(context, listen: false)
                        .setSublevel(context, 6);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopList(),
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
          ],
        ),
      ),
    );
  }
}
