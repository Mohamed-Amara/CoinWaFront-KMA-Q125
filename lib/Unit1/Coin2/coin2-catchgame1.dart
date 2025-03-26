import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-shopping_intro.dart';

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
        home: FallingCoinsGamePage(targetAmount: 5),
      ),
    );
  }
}

class FallingCoinsGamePage extends StatefulWidget {
  final int targetAmount;

  const FallingCoinsGamePage({super.key, required this.targetAmount});

  @override
  _FallingCoinsGamePageState createState() => _FallingCoinsGamePageState();
}

class _FallingCoinsGamePageState extends State<FallingCoinsGamePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<FallingItem> _fallingItems = [];
  final List<String> coinImages = [
    'assets/flatcoin.png',
    'assets/hammer.png',
  ];
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 3))
      ..addListener(() {
        setState(() {
          for (var item in _fallingItems) {
            item.fallDistance += 2.5;
            if (item.fallDistance > MediaQuery.of(context).size.height) {
              if (isCoinCaught(item)) {
                Provider.of<GameModel>(context, listen: false)
                    .adjustScore(item.imagePath);
              }
              resetItem(item);
            }
          }

          if (Provider.of<GameModel>(context, listen: false).score >=
              widget.targetAmount) {
            _gameOver = true;
            _controller.stop(); // Stop the animation

            // Navigate to the SuccessScreen
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SuccessScreen()),
              );
            });
          }
        });
      });

    startGame();
  }

  void startGame() {
    Timer.periodic(const Duration(milliseconds: 1700), (timer) {
      if (!_gameOver && _fallingItems.length < 3) {
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
    final gameModel = Provider.of<GameModel>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    double piggyBankWidth = 200;
    double piggyBankLeft = (screenWidth / 2) +
        (gameModel.piggyBankPosition * (screenWidth / 2)) -
        (piggyBankWidth / 2);
    double piggyBankRight = piggyBankLeft + piggyBankWidth;

    double middleStart = piggyBankLeft + (piggyBankWidth * 0.25);
    double middleEnd = piggyBankRight - (piggyBankWidth * 0.25);
    double coinBottom = item.fallDistance + 35;

    double piggyBankTop = MediaQuery.of(context).size.height - 150;
    double validCatchHeight = piggyBankTop + (150 / 2);

    return (item.leftPosition >= middleStart &&
        item.leftPosition <= middleEnd &&
        coinBottom >= validCatchHeight);
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
                child: Coin(imagePath: item.imagePath),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  Provider.of<GameModel>(context, listen: false)
                      .movePiggyBank(details.primaryDelta!);
                },
                child: const PiggyBank(),
              ),
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
              top: 90,
              child: ExitButton(),
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
                  if (score < widget.targetAmount) {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text("Keep Saving!"),
                        content: Text("You need to collect 5 coins to exit."),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessScreen()),
                    );
                  }
                },
              ),
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
      width: 70,
      height: 70,
    );
  }
}

class PiggyBank extends StatelessWidget {
  const PiggyBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          Provider.of<GameModel>(context, listen: false)
              .movePiggyBank(details.primaryDelta!);
        },
        child: Consumer<GameModel>(
          builder: (context, model, child) {
            return Align(
              alignment: Alignment(model.piggyBankPosition, 1),
              child: Image.asset(
                'assets/half_piggy.png',
                width: 200,
                height: 150,
              ),
            );
          },
        ),
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
    _piggyBankPosition += delta / 300; // Adjust speed
    _piggyBankPosition = _piggyBankPosition.clamp(-1.0, 1.0); // Keeps pig in bounds
    notifyListeners();
  }

  void adjustScore(String coinImagePath) {
    _score += (coinImagePath == 'assets/flatcoin.png') ? 1 : -1;
    notifyListeners();
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You Saved Enough!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/half_piggy.png', 
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopList(), // Replace if needed
                  ),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}