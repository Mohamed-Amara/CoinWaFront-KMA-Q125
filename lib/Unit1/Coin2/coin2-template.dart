import 'package:flutter/material.dart';

class Savings {
  final String title;
  final String iconTitle;
  final String paragraph;
  final String scenarioImage;

  Savings({
    required this.title,
    required this.iconTitle,
    required this.paragraph,
    required this.scenarioImage,
  });
}

class Information extends StatelessWidget {

  final Savings saving;

  const Information({super.key, required this.saving});

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
                          saving.iconTitle,
                          height: 80,
                          width: 80,
                          alignment: Alignment.center,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            saving.title,
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
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: Text(
                        saving.paragraph,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Color(0xff5E17EB),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Stack(children: [
                  if (saving.title == 'EMERGENCY FUND!' ||
                      saving.title == 'FUTURE PLANS' ||
                      saving.title == 'AVOIDING DEBT')
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: const Color(0xffACB8C0),
                        height: 100,
                      ),
                    ),
                  if (saving.title == 'EMERGENCY FUND!')
                    Align(
                       alignment: Alignment.bottomCenter,
                      child: Container(
                        color: const Color(0xffACB8C0),
                        height: 200.0,
                      ),
                    ),
                  Image.asset(
                    saving.scenarioImage,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
