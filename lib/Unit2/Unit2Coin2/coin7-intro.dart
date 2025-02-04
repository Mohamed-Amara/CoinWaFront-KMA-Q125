import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-explain1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-page2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
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
        ),),
      ),
    ),
  );
}

class Coin7Intro extends StatelessWidget {
  const Coin7Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      purpleTextBubble('Now, do you remember which object you picked in the last coin?'),
                      const SizedBox(height: 40),
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
                            MaterialPageRoute(builder: (context) => const Coin7Page2()),
                          );
                          }, icon: Image.asset('assets/Unit 2/dragonegg.png', width: 140))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Coin7Page2()),
                          );
                          }, icon: Image.asset('assets/cartonmilk.png', width: 100),)
                          
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Coin7Page2()),
                          );
                          }, icon:  Image.asset('assets/blackhouse.png', width: 120),)
                         
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
        )
      ),
    );
  }
}