import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page3.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

Widget purpleTextBubble(String description) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xff7870de),
    ),
    width: 350,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Center(
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    ),
  );
}

class Coin7Page2 extends StatelessWidget {
  const Coin7Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: GestureDetector(
        onTap: () {
          if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 1 && Provider.of<ProgressProvider>(context, listen: false).level == 7) {
            Provider.of<ProgressProvider>(context,listen: false).setSublevel(context, 2);
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Coin7Page3()),
          );
        },
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        purpleTextBubble('Well, after a few days, they became...'),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/dragonegghatch.png', width: 120),
                                  const SizedBox(width: 10),
                                  Text(
                                    'A Super Rare Dragon!',
                                    style: TextStyle(fontSize: 20, fontFamily: 'Source', color: Color(0xff7870de)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Spoiled Milk!',
                                    style: TextStyle(fontSize: 20, fontFamily: 'Source', color: Color(0xff7870de)),
                                  ),
                                  const SizedBox(width: 30),
                                  Image.asset('assets/badmilk.png', width: 160),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/blackhouse2.png', width: 130),
                                  const SizedBox(width: 40),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'A More Expensive\n House!',
                                    style: TextStyle(fontSize: 20, fontFamily: 'Source', color: Color(0xff7870de)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
                        totalPages: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
