import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';

class AssetsTemplate {
  final String title;
  final String iconTitle;
  final String paragraph1;
  final String paragraph2;
  final String scenarioImage;

  AssetsTemplate({
    required this.title,
    required this.iconTitle,
    required this.paragraph1,
    required this.paragraph2,
    required this.scenarioImage,
  });
}

class AssetsInformation extends StatelessWidget {

  final AssetsTemplate assets;

  const AssetsInformation({super.key, required this.assets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: const BoxDecoration(
              color: Color(0xff8483E4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          assets.iconTitle,
                          height: 80,
                          width: 80,
                          alignment: Alignment.center,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            assets.title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                const SizedBox(height: 40),
                SpeechBubble(assets.paragraph1, true),
                const SizedBox(height: 20),
                SpeechBubble(assets.paragraph2, false),
                const SizedBox(height: 20),
                Image.asset(assets.scenarioImage, width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
