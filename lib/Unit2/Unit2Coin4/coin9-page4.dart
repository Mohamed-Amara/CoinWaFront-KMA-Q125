

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page4-explain.dart';

class Coin9Page4 extends StatelessWidget {
  final bool isRepeat;
  const Coin9Page4({super.key, required this.isRepeat});

  @override
  Widget build(BuildContext context) {
    return  Coin9Template(
      imagename: 'assets/Unit 2/daboss.png',
      name: 'Da Boss',
      assets: 5,
      liabilities: 2, 
      route: Coin9Page4Explain(), sublevel: 4, isRepeat: isRepeat,
    );
  }
}
