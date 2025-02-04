import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page6-explain.dart';
import 'package:provider/provider.dart';

class Coin9Page6 extends StatelessWidget {
  final bool isRepeat;
  const Coin9Page6({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 6);
    }

    return  Coin9Template(
      imagename: 'assets/Unit 2/fancypig.png',
      name: 'Fancy Pig',
      assets: 2,
      liabilities: 5,
      route: Coin9Page6Explain(),
      sublevel: 6, isRepeat: isRepeat,
    );
  }
}
