import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin6Explain1 extends StatelessWidget {
  const Coin6Explain1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
                        totalPages: 5,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (Provider.of<ProgressProvider>(context, listen: false).level == 6) {
                    Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Coin6Explain2()),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WawaTalking(
                          'Now, an Asset is something you own that has value, and may increase in value in the future',
                          "assets/wawaTalk.png"),
                      const SizedBox(height: 20),
                      Image.asset('assets/Unit 2/house_asset.png', width: 250),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
