import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin18/coin18-page13.dart';

class Coin18Page12_ extends StatefulWidget {
  @override
  Coin18Page12 createState()=> Coin18Page12();
}

class Coin18Page12 extends State<Coin18Page12_> {
  final List<String> visited = [];

  void _showPopup(BuildContext context, String title, String description, String picture) {
    if (!visited.contains(title)) {
      visited.add(title);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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
                // Title
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

                // 📝 Description
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  // animationSpeed: const Duration(milliseconds: 5000),
                ),
                const SizedBox(height: 20),

                // Right Image
                Image.asset(
                  picture, // Added correct file extension
                  width: 110,
                  height: 110,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (visited.length == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Coin18Page13(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      visited.length == 4
                          ? 'Finish'
                          : 'Continue',
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final screenHeight = MediaQuery.of(context).size.height;

    String piggyText = "Any money you put into your retirement savings is tax ";
    piggyText += "deductible (up to a limit). This is great if you start saving ";
    piggyText += "early since you'll have more saved up for later and have to pay";
    piggyText += " less taxes now! Win-win!";

    String diplomaText = "If you are or are planning to pursue ";
    diplomaText += "a post-secondary education, your tuition fees and interest ";
    diplomaText += "for any student loans can be claiemd as deductions! In some ";
    diplomaText += "places, even the money you spend on textbooks can be claimed!";

    String mailText = "Money you donate to registered charities can also be clai";
    mailText += "med as a tax refund! Even any charities you have donated to in ";
    mailText += "the past 5 years can be claimed! This is a great way to save ";
    mailText += "some money and do some good for your community and the world!";

    String receiptText = "If you have a lot, medical expenses can be claimed as";
    receiptText += " tax deductions. Prescriptions, dental, vision, medical devi";
    receiptText += "ces, some types of therapy, and even travel costs for medical";
    receiptText += " reasons could be deductible!";

    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen Beach Background
          Positioned.fill(
            child: Image.asset(
              'assets/beach_background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Top section with title
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: Container(
                  width: screenWidth,
                  height: 180,
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
                width: screenWidth,
                height: 180,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 140, 82, 255),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: Text(
                        "Find and click any mysterious items",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Source",
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Piggy Bank
          Positioned(
            left: 35,
            bottom: 240,
            child: GestureDetector(
              onTap: () {
                _showPopup(context, "YOU FOUND RETIREMENT SAVINGS!", piggyText, 
                "assets/pink_piggy.png");
              },
              child: Image.asset(
                'assets/pink_piggy.png',
                width: screenWidth * 0.125,
              ),
            ),
          ),

          // Message in a Bottle
          Positioned(
            right: screenWidth * 0.0875,
            bottom: screenHeight * 0.173,
            child: GestureDetector(
              onTap: () {
                _showPopup(context, "YOU FOUND A DIPLOMA!", diplomaText, 
                "assets/treasure_bottle.png");
              },
              child: Image.asset(
                'assets/treasure_bottle.png',
                width: screenWidth * 0.1375,
              ),
            ),
          ),

          // Bird with Mail
          Positioned(
            right: screenWidth * 0.275,
            top: screenHeight * 0.3172,
            child: GestureDetector(
              onTap: () {
                _showPopup(context, "YOU FOUND A CHARITY INVITATION!",
                mailText, "assets/bird_mail.png");
              },
              child: Image.asset(
                'assets/bird_mail.png',
                width: screenWidth * 0.25,
              ),
            ),
          ),

          // Receipt
          Positioned(
            right: screenWidth * 0.225,
            bottom: screenHeight * 0.05767,
            child: GestureDetector(
              onTap: () {
                _showPopup(context, "YOU FOUND A HOSPITAL RECEIPT!", 
                receiptText, "assets/receipt.png");
              },
              child: Image.asset(
                'assets/receipt.png',
                width: screenWidth * 0.15,
              ),
            ),
          ),

          // Exit Button
          ExitButton(),
          const Align(
            alignment: Alignment.topRight,
            child: TopBar(
              currentPage: 12,
              totalPages: 16,
            ),
          ),
        ],
      ),
    );
  }
}
