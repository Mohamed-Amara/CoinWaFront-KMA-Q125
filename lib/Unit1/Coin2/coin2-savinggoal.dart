import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-game1.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CatchIntro1());
}

class CatchIntro1 extends StatelessWidget {
  const CatchIntro1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Detector Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FullScreenImagePage(),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  const FullScreenImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            const Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TopBar(
                                currentPage: 4,
                                totalPages: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
            ExitButton(),
            GestureDetector(
              onTap: () {
                if (Provider.of<ProgressProvider>(context, listen: false).level == 2){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 5);
                }
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FallingCoins(),
                ),
              );
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          WawaTalking('Choose a saving goal below! Keep this number in mind! On the next page, you need to save enough to afford it!', 'assets/wawaBag.png'),
                          Image.asset('assets/savinggoal.png', width: 400)
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
