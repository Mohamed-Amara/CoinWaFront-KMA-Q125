import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/typing_text.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String description;
  final String imgUrl;

  const CustomPopup({
    Key? key,
    required this.title,
    required this.description,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: const Color(0xffeae9ff),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title Text
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Description and Images
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xff7870de),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: TypingText(
                    text: description,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    animationSpeed: const Duration(milliseconds: 2000),
                  ),
                ),
                Image.asset(
                  'assets/trianglecut2.png',
                  width: 10,
                ),
                const SizedBox(height: 25),
                Image.asset(
                  imgUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Continue button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
