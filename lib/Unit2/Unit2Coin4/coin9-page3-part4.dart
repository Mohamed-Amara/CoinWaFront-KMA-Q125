import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin9Page3Part4 extends StatelessWidget {
  const Coin9Page3Part4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
                                         Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 4);
                                      }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Coin9Page4(isRepeat: false,)),
                    );
                  },
                  child: Center(
                    child: Column(
                      children: [
                        const Text("Now let's see an example ...", textAlign: TextAlign.center, style: TextStyle(
                          color: Color(0xff5e17eb), 
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 40),
                        Image.asset('assets/wawaConfused.png', width: 200)
                      ]
                    ),
                  )
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
                      currentPage: 3,
                      totalPages: 10,
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
