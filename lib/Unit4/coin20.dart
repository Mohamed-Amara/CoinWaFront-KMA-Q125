import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/lobby.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Coin20());
}

class Coin20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationScreen(),
      routes: {
        '/next': (context) => const LobbyPage(),
      },
    );
  }
}

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _fallAnimation;
  late Animation<Offset> _riseAnimation;
  late ConfettiController _confettiController;
  bool _isConfettiDone = false;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fallAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 1.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _riseAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _confettiController = ConfettiController(duration: const Duration(seconds: 3));

    _controller.forward().then((_) {
      _confettiController.play();
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isConfettiDone = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _navigateToNextScreen() {
    if (_isConfettiDone) {
      Navigator.pushNamed(context, '/next');
    }
  }


  @override
  Widget build(BuildContext context) {

    var progressProvider = Provider.of<ProgressProvider>(context, listen: false);

    if (progressProvider.level == 20) {
      Provider.of<CoinProvider>(context, listen: false).incrementCoin(context);
      progressProvider.incrementProgress(context);
      progressProvider.setSublevel(context,1);
    }

    return GestureDetector(
      onTap: _navigateToNextScreen,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: Stack(
          children: [
            SlideTransition(
              position: _fallAnimation,
              child: Center(
                child: Image.asset('assets/wallet_coin.png', width: 70, height: 70),
              ),
            ),
            SlideTransition(
              position: _riseAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/wawaholding.png', width: 530, height: 530),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: FadeTransition(
                opacity: _controller.drive(CurveTween(curve: const Interval(0.5, 1.0, curve: Curves.easeIn))),
                child: const Padding(
                  padding: EdgeInsets.only(top: 150, right: 6, left: 6),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Congratulations! You filled Piggy Bank 3: Credit Cards!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 120, 112, 222),
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

