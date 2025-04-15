import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';


class SpeechBubble extends StatelessWidget {
  final String description;
  final bool isLeft;
  final Color speechColor; // Added speechColor
  final String triImage; // Added triImage
  final Duration speed; // Added speed
  final double textSize;

  const SpeechBubble(
      this.description,
      this.isLeft, {
        super.key,
        required this.speechColor,
        required this.triImage,
        required this.speed,
        required this.textSize,
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -15,
          left: isLeft ? 40 : null,
          right: !isLeft ? 120 : null,
          child: Image.asset(triImage, width: 35), // Use triImage parameter
        ),
        Container(
          width: 320,
          decoration: BoxDecoration(
            color: speechColor, // Use speechColor parameter
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: TypingText(
                text: description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                  color: Color.fromARGB(255, 248, 248, 248),
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source',
                ),
                animationSpeed: speed,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class SpeechPageTemplate extends StatelessWidget {
  final bool isLeft;
  final String imagePath;
  final String text;
  final String headerText;
  final int currentPage;
  final int totalPages;
  final Widget? nextPage;
  final Color speechColor;
  final String triImage;
  final Duration speed;
  final Color headerColorTop;
  final Color headerColorBot;
  final double image_height;
  final double image_width;
  final double textSize;

  const SpeechPageTemplate({
    super.key,
    required this.isLeft,
    required this.imagePath,
    required this.text,
    required this.headerText,
    required this.triImage,
    this.currentPage = 1,
    this.totalPages = 1,
    this.nextPage,
    this.speechColor = const Color(0xff7870DE),
    this.speed = const Duration(milliseconds: 1500),
    this.headerColorTop = const Color.fromARGB(255, 91, 24, 233),
    this.headerColorBot = const Color.fromARGB(255, 140, 82, 255),
    this.image_height = 350,
    this.image_width = 270,
    this.textSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (nextPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage!),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //should go top
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 15,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            color: headerColorTop,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20),
                        decoration: BoxDecoration(
                          color: headerColorBot,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              headerText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Source",
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SpeechBubble(
                    text,
                    isLeft,
                    speechColor: speechColor,
                    triImage: triImage,
                    speed: speed,
                    textSize: textSize,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Centering the image horizontally
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          imagePath,
                          width: image_width,
                          height: image_height,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              ExitButton(),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: currentPage,
                        totalPages: totalPages,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
