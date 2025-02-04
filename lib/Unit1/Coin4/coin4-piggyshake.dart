import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-bookshelf.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-tapphone.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Coin4shake());
}

class Coin4shake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShakeDropPage(),
    );
  }
}

class ShakeDropPage extends StatefulWidget {
  @override
  _ShakeDropPageState createState() => _ShakeDropPageState();
}

class _ShakeDropPageState extends State<ShakeDropPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;
  bool _isDropped = false;
  int _tapCount = 0;
  final int _requiredTaps = 5; // Number of taps required to drop the coin

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: _sizeController, curve: Curves.easeInOut),
    );

    _sizeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _sizeController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  void _tapPig() {
    setState(() {
      _tapCount++;
    });
    _sizeController.forward();

    if (_tapCount >= _requiredTaps) {
      _dropImage();
    }
  }

  void _dropImage() {
    if (!_isDropped) {
      setState(() {
        _isDropped = true;
      });
      _controller.forward();
    }
  }

  void _tapCoin() {
    if (_isDropped) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CoinRisePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tap The Piggy Bank!',
          style: TextStyle(
            fontFamily: 'Source', // Specify your font family here
            fontSize: 30.0, // Adjust the font size
            fontWeight: FontWeight.bold, // Set the font weight
            color: Color.fromARGB(255, 120, 112, 222), // Set the font color
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 100, // Adjust this value to move the pig up or down
            left: MediaQuery.of(context).size.width / 2 - 150,
            child: GestureDetector(
              onTap: _tapPig,
              child: AnimatedBuilder(
                animation: _sizeAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _sizeAnimation.value,
                    child: Transform.rotate(
                      angle: 3.14159, // 180 degrees in radians
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  'assets/smallpig.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          ),
          if (_isDropped)
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  bottom:
                      300 * (1 - _animation.value), // Adjusted bottom position
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: child!,
                );
              },
              child: GestureDetector(
                onTap: _tapCoin,
                child: Image.asset(
                  'assets/flatcoin.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CoinRisePage extends StatefulWidget {
  @override
  _CoinRisePageState createState() => _CoinRisePageState();
}

class _CoinRisePageState extends State<CoinRisePage>
    with TickerProviderStateMixin {
  late AnimationController _riseController;
  late AnimationController _growController;
  late Animation<double> _riseAnimation;
  late Animation<double> _growAnimation;

  @override
  void initState() {
    super.initState();

    _riseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _growController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _riseAnimation = Tween<double>(begin: 1, end: 0.4).animate(
      CurvedAnimation(parent: _riseController, curve: Curves.easeInOut),
    );

    _growAnimation = Tween<double>(begin: 1, end: 4).animate(
      CurvedAnimation(parent: _growController, curve: Curves.easeInOut),
    );

    _riseController.forward().then((_) {
      _growController.forward();
    });
  }

  @override
  void dispose() {
    _riseController.dispose();
    _growController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 1) {
      Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Bookshelf(),
      ),
    ); //should reroute back to shelf - this is when the screen is tapped on the page when the coin with text pops up
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _handleTap,
        behavior: HitTestBehavior
            .opaque, // Ensures the gesture detector covers the entire screen
        child: AnimatedBuilder(
          animation: Listenable.merge([_riseAnimation, _growAnimation]),
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  top:
                      MediaQuery.of(context).size.height * _riseAnimation.value,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Transform.scale(
                    scale: _growAnimation.value,
                    child: Image.asset(
                      'assets/shakecoin.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
