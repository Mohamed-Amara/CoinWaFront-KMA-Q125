import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Templates/getstarted-template.dart';
import 'package:flutter_application_1/lobby.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const CoinApp(coinNumber: 1, description: 'What is Saving?'));

class CoinApp extends StatelessWidget {
  final int coinNumber;
  final String description;

  const CoinApp({super.key, required this.coinNumber, required this.description});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoinAnimationScreen(coinNumber: coinNumber, description: description),
    );
  }
}

class CoinAnimationScreen extends StatefulWidget {
  final int coinNumber;
  final String description;

  const CoinAnimationScreen({super.key, required this.coinNumber, required this.description});

  @override
  _CoinAnimationScreenState createState() => _CoinAnimationScreenState();
}

class _CoinAnimationScreenState extends State<CoinAnimationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _verticalTranslation;
  late Animation<double> _rotation;
  late Animation<double> _scale;
  late Animation<double> _textOpacity;
  late Animation<double> _secondImageTranslation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _verticalTranslation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0, // Start of the animation
          0.7, // End of the vertical translation
          curve: Curves.easeInOut,
        ),
      ),
    );

    _rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0, // Start of the rotation
          0.7, // End of the rotation
          curve: Curves.linear,
        ),
      ),
    );

    _scale = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.7, // Start of the scaling
          1.0, // End of the scaling
          curve: Curves.easeInOut,
        ),
      ),
    );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.8, // Start of the text opacity animation
          1.0, // End of the text opacity animation
          curve: Curves.easeInOut,
        ),
      ),
    );

    _secondImageTranslation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.8, // Start of the second image translation animation
          1.0, // End of the second image translation animation
          curve: Curves.easeInOut,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    
    var progressProvider = Provider.of<ProgressProvider>(context, listen: false);
    var profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    bool babyCheck = (progressProvider.level == 1 && widget.coinNumber == 1);
    bool gotWrong = progressProvider.currentLevelIncorrectQuestions.isNotEmpty;

   

    Widget routing;
    print (gotWrong);
    if (gotWrong) {
      int firstIncorrectSublevel = progressProvider.currentLevelIncorrectQuestions.first;
      routing = redirect[widget.coinNumber - 1][firstIncorrectSublevel];
    } else {
      routing = const LobbyPage();
    }
    print (progressProvider.level);
    print(widget.coinNumber);
 if (progressProvider.level == widget.coinNumber && gotWrong == false) {
      Provider.of<CoinProvider>(context, listen: false).incrementCoin(context);
      progressProvider.incrementProgress(context);
      progressProvider.setSublevel(context, 1);
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: gotWrong
          ? Center(
              child: GestureDetector(
                onTap: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => routing,
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WawaTalking(
                          "Let's go over some of the questions you got wrong!",
                          "assets/wawaTalk.png",
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Tap to Continue ...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Stack(
              children: [
                Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          0,
                          (_verticalTranslation.value - 0.5) * MediaQuery.of(context).size.height,
                        ),
                        child: Transform.rotate(
                          angle: _rotation.value * 2 * 3.1415926535897932,
                          child: Transform.scale(
                            scale: _scale.value,
                            child: GestureDetector(
                              onTap: () {
                                if (babyCheck) {
                                  profileProvider.updateUserBadge(context, "baby");
                                }
                                if (progressProvider.currentLevelIncorrectQuestions.isEmpty &&
                                    !profileProvider.badges.contains("assets/Badges/finwhiz.png")) {
                                  profileProvider.updateUserBadge(context, "finwhiz");
                                }

                                if (_controller.isCompleted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LobbyPage(),
                                    ),
                                  );
                                }
                              },
                              child: child,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/wallet_coin.png', // Ensure this path is correct
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _textOpacity.value,
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Congratulations!\n You completed Coin ${widget.coinNumber} on: \n "${widget.description}"',
                            style: const TextStyle(
                              fontFamily: 'Source',
                              fontSize: 30,
                              color: Color.fromARGB(255, 120, 112, 222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 0,
                  right: 0,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          0,
                          _secondImageTranslation.value * MediaQuery.of(context).size.height,
                        ),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'assets/suprisedwawa.png', // Ensure this path is correct
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
