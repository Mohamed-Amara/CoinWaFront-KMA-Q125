import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-drag.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page2.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-page8.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin11Page9Bus extends StatelessWidget {
  const Coin11Page9Bus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 4);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin11Drag(isRepeat: false,)),
                );
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpeechBubbleYellow("Great Choice! Although buying a used car with the student loan money saves time, it can cause Bad Debt", true, ["Bad", "Debt"]),
                    const SizedBox(height: 20),
                    SpeechBubbleYellow("This means borrowed money that is used for purchasing a depreciating asset!", false, ["depreciating"]),
                    const SizedBox(height: 20),
                    Image.asset('assets/Unit 3/wawaBus.png', width: 350),
                            
                  ],
                ),
              )
            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 3,
                      totalPages: 6,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
