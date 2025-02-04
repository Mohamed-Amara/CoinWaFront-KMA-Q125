import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page2.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part4.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class Coin9TemplateExplain extends StatelessWidget {
  final String description;
  final String imagename;
  final String numerical;
  final Widget route;
  final int sublevel;
  const Coin9TemplateExplain({super.key, required this.description, required this.imagename, required this.numerical, required this.route, required this.sublevel});

  Widget WawaTalking(String description, String imageName) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpeechBubbleYellow(description, false, ["value", "assets", "liabilities"]),
        const SizedBox(height: 20),
        Image.asset(imageName, height: 150),
      ],
    );
  }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => route),
                    );
                  },
                  child: Column(
                    children: [
                      WawaTalking(
                        description,
                        "assets/wawaTalk.png",
                      ),
                      const SizedBox(height: 20),
                      Image.asset(imagename, width: 300),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                color: (numerical == "")? Colors.transparent: Color(0xff5e17eb),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  numerical,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            ExitButton(),
           Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: sublevel,
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

