import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Templates/popup.dart';
import 'package:flutter_application_1/Templates/Image-and-speech.dart';
import './page7.dart';

class iconPage extends StatefulWidget {
  @override
  _iconPage createState() => _iconPage();
}

class _iconPage extends State<iconPage> {
  bool can_continue = false;
  Set<String> clickedSections = {};

  void handleSectionClick(String label) {
    setState(() {
      clickedSections.add(label);
      if (clickedSections.containsAll([
        'Spend It Now',
        'Save it For Later',
        'Invest for Later'
      ])) {
        can_continue = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 91, 24, 233),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 140, 82, 255),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(height: 30),
                          Text(
                            "What is Investing",
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PillButton(
                      iconPath: 'assets/Unit5/game_icon.png',
                      label: 'Spend It Now',
                      title: 'Title',
                      description: 'Description',
                      popup_image: 'assets/wawaConfused.png',
                      onPressed: handleSectionClick,
                    ),
                    SizedBox(height: 15),
                    PillButton(
                      iconPath: 'assets/Unit5/pig_icon.png',
                      label: 'Save it For Later',
                      title: 'Title',
                      description: 'Description',
                      popup_image: 'assets/wawaConfused.png',
                      onPressed: handleSectionClick,
                    ),
                    SizedBox(height: 15),
                    PillButton(
                      iconPath: 'assets/Unit5/investment_icon.png',
                      label: 'Invest for Later',
                      title: 'Title',
                      description: 'Description',
                      popup_image: 'assets/wawaConfused.png',
                      onPressed: handleSectionClick,
                    ),
                  ],
                ),
                Spacer(),
                SpeechBubble(
                  'I give you three wishes, Learn about each one and make your choice!',
                  false,
                  speechColor: Color(0xff57beda),
                  triImage: 'assets/Unit5/blue-triangle.png',
                  speed: Duration(milliseconds: 1500),
                  textSize: 20,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/Unit5/gene.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SizedBox(
                  width: 150,
                  height: 45,
                  child:can_continue
                    ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page7()),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2f008d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                    : Container(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05)
              ],
            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 1,
                      totalPages: 6,
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

class PillButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final String title;
  final String description;
  final String popup_image;
  final Function(String label) onPressed;

  const PillButton({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.title,
    required this.description,
    required this.popup_image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(label);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomPopup(
              title: title,
              description: description,
              imgUrl: popup_image,
            );
          },
        );
      },
      child: Container(
        width: 260,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFB2A4FF),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFF3C009D),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                iconPath,
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
