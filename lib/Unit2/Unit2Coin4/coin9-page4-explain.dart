import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-explain-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5.dart';

class Coin9Page4Explain extends StatelessWidget {
  const Coin9Page4Explain({super.key});

  @override
  Widget build(BuildContext context) {
    return Coin9TemplateExplain(description: "Now Da Boss did not just have \$5 lying around to user! These \$5 were in assets like items!", imagename: 'assets/Unit 2/daboss.png', numerical: "\$5 in assets", route: Coin9Page5Intro(), sublevel: 4,);
  }
}