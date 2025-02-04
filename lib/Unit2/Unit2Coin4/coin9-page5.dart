import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-explain.dart';
import 'package:provider/provider.dart';

class Coin9Page5 extends StatelessWidget {
  final bool isRepeat;
  const Coin9Page5({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
      Provider.of<ProgressProvider>(context, listen: false)
          .setSublevel(context, 5);
    }
    return  Coin9Template(
      imagename: 'assets/Unit 2/Icon.png',
      name: 'The Icon',
      assets: 10,
      liabilities: 2,
      route: Coin9Page5Explain(),
      sublevel: 5, isRepeat: isRepeat,
    );
  }
}
