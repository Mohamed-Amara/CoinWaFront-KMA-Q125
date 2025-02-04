import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain1.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget purpleTextBubble(String description){
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
          textAlign: TextAlign.center,
          description, style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24,
          height: 1.3
        ),),
      ),
    ),
  );
}

class Coin6Intro extends StatelessWidget {
  const Coin6Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: ExitButton()),
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      purpleTextBubble('Before we begin... pick an object! Remember it for later!'),
                      const SizedBox(height: 60),
                      SizedBox(
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Coin6Explain1()),
                          );
                          }, icon: Image.asset('assets/Unit 2/dragonegg.png', width: 120))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Coin6Explain1()),
                          );
                          }, icon: Image.asset('assets/milk.png', width: 120),)
                          
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Coin6Explain1()),
                          );
                          }, icon:  Image.asset('assets/grad.png', width: 120),)
                         
                        ],
                      )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}