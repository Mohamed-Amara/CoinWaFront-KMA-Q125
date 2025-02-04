import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-explain-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-networth-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page5.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page6.dart';

class Coin9Page5Explain extends StatelessWidget {
  const Coin9Page5Explain({super.key});

  @override
  Widget build(BuildContext context) {
    return Coin9TemplateExplain(description: "“\$8,000,000? They can buy anything!” you might think. But, once again, net worth doesn't really refer to how much money they have freely available.", imagename: 'assets/Unit 2/Icon.png', numerical: "\$8 Million Net Worth", route: Coin9Page5Explain2(), sublevel: 5,);
  }
}

class Coin9Page5Explain2 extends StatelessWidget {
  const Coin9Page5Explain2({super.key});

  @override
  Widget build(BuildContext context) {
    return Coin9TemplateExplain(description: "If the icon really wanted to be able to use that \$8,000,000 freely, they would have to sell their assets and pay off all their liabilities!", imagename: 'assets/Unit 2/Icon.png', numerical: "\$8 Million Net Worth", route: Coin9Page6(isRepeat: false,), sublevel: 5,);
  }
}