import 'dart:math';
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
        home: FallingCoinsGamePage(),
      ),
    );
  }
}

class FallingCoinsGamePage extends StatefulWidget {
  const FallingCoinsGamePage({super.key});

  @override
  _FallingCoinsGamePageState createState() => _FallingCoinsGamePageState();
}

class _FallingCoinsGamePageState extends State<FallingCoinsGamePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _coinLeftPosition = 0.0;
  String _currentCoinImage = 'assets/flatcoin.png'; // Default value

  List<String> coinImages = [
    'assets/flatcoin.png',
    'assets/hammer.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: -50.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (isCoinCaught()) {
            Provider.of<GameModel>(context, listen: false)
                .adjustScore(_currentCoinImage);
          }
          resetCoin();
        }
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      resetCoin();
    });
  }

  void resetCoin() {
    setState(() {
      _currentCoinImage = coinImages[Random().nextInt(coinImages.length)];
      _coinLeftPosition = Random().nextDouble() * MediaQuery.of(context).size.width;
      _animation = Tween<double>(begin: -50.0, end: MediaQuery.of(context).size.height).animate(_controller);
    });
    _controller.reset();
    _controller.forward();
  }

  bool isCoinCaught() {
    double piggyBankPosition =
        Provider.of<GameModel>(context, listen: false).piggyBankPosition;
    double piggyBankLeft = (MediaQuery.of(context).size.width / 2) +
        (piggyBankPosition * (MediaQuery.of(context).size.width / 2)) -
        50;
    double piggyBankRight = piggyBankLeft + 100;
    return (_coinLeftPosition >= piggyBankLeft &&
        _coinLeftPosition <= piggyBankRight);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentCoinImage.isEmpty) {
      return Container();
    }

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
                child: Container(  // Fixed container widget usage
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  decoration:  BoxDecoration(
                    color: Color(0xff8483E4),
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
            Row(
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
            Positioned(
              top: _animation.value,
              left: _coinLeftPosition,
              child: Coin(imagePath: _currentCoinImage),
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
                      style: const TextStyle(fontSize: 30, fontFamily: 'Source'));
                },
              ),
            ),
            Positioned(
              top: 60,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
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
            )
          ],
        ),
      ),
    );
  }
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
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Container(
          width: 50,
          height: 50,
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
            alignment: Alignment(model.piggyBankPosition, 1.09),
            child: Image.asset(
              'assets/half_piggy.png',
              width: 140,
              height: 100,
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
                  )
                : Container(),
            const SizedBox(height: 20),
            if (imagePath.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  if (Provider.of<ProgressProvider>(context, listen: false).level == 2) {
                    Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 6);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopList(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 255, 241, 219), // Text color
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Source', // Use the custom font here if needed
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Continue',
                    style: TextStyle(fontFamily: 'Source', color: Colors.purple)),
              ),
          ],
        ),
      ),
    );
  }
}
