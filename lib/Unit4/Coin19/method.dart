import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import '../../Templates/typing_text.dart';
import './tax-form.dart';

class Method extends StatefulWidget {
  const Method({super.key});

  @override
  _MethodPageState createState() => _MethodPageState();
}

class _MethodPageState extends State<Method> {
  Set<String> clickedSections = {};
  bool allSectionsClicked() {
    return clickedSections.length == 3; // Total of 5 sections
  }

  void _showPopup(String title, String description) {
    showDialog(
      context: context,
      barrierColor:
          Colors.black.withOpacity(0.7), // Transparent black background
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff), // Purple background
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/wawaConfused.png',
                      width: (MediaQuery.of(context).size.width * 0.25)
                          .clamp(0, 150),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  title, // Use the title parameter
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TypingText(
                  text:description, // Use the description parameter
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Close the popup on "Continue"
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // White text color
                        fontWeight: FontWeight.bold,
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
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                        height: 180, // Increased height for more space
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
                      height: 180, // Increased height for better alignment
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
                          // Image beside the text
                          Image.asset(
                            'assets/laptop.png',
                            width: 90, // Increased size for better balance
                          ),
                          const SizedBox(
                              width: 10), // Space between image and text
                          Flexible(
                            child: Text(
                              "Choose Your Method",
                              softWrap:
                                  true, // Allows text to wrap to the next line
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32, // Increased font size
                                fontWeight: FontWeight.bold,
                                fontFamily: "Source",
                                height:
                                    1.3, // Adjust line height for better readability
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                const Text(
                  "Click to learn how to file taxes",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                SizedBox(
                  width:
                      double.infinity, // Makes the button stretch horizontally
                  height: MediaQuery.of(context).size.height *
                      0.15, // 25% of screen height
                  child: ElevatedButton(
                    onPressed: () {
                      if (!clickedSections.contains("Online")) {
                        setState(() {
                          clickedSections.add("Online");
                        });
                      }
                      _showPopup("Online",
                          "You can use a website or an app to enter your tax info, and the system helps calculate everything for you. Once you're done, you send it directly to the government. It’s fast, easy, and you might even get a refund quicker!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8c52ff),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            0.1, // 10% of screen width
                        vertical: MediaQuery.of(context).size.height *
                            0.02, // 2% of screen height
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Online",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32, // Increased font size
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source",
                        height:
                            1.3, // Adjust line height for better readability
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                SizedBox(
                  width:
                      double.infinity, // Makes the button stretch horizontally
                  height: MediaQuery.of(context).size.height *
                      0.15, // 25% of screen height
                  child: ElevatedButton(
                    onPressed: () {
                      if (!clickedSections.contains("Manual")) {
                        setState(() {
                          clickedSections.add("Manual");
                        });
                      }
                      _showPopup("Manual",
                          "Some people prefer to fill out tax forms by hand and mail them to the government. It takes longer to process, and you have to be careful with math, but it’s still a valid way to file taxes!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5e17eb),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            0.1, // 10% of screen width
                        vertical: MediaQuery.of(context).size.height *
                            0.02, // 2% of screen height
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Manual",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32, // Increased font size
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source",
                        height:
                            1.3, // Adjust line height for better readability
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                SizedBox(
                  width:
                      double.infinity, // Makes the button stretch horizontally
                  height: MediaQuery.of(context).size.height *
                      0.15, // 25% of screen height
                  child: ElevatedButton(
                    onPressed: () {
                      if (!clickedSections.contains("Professional")) {
                        setState(() {
                          clickedSections.add("Professional");
                        });
                      }
                      _showPopup("Professional",
                          "If taxes feel confusing, you can ask a tax expert (like an accountant) to do them for you. They make sure everything is correct and might even find ways to help you pay less tax or get a bigger refund!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff004aad),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            0.1, // 10% of screen width
                        vertical: MediaQuery.of(context).size.height *
                            0.02, // 2% of screen height
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Professional",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32, // Increased font size
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source",
                        height:
                            1.3, // Adjust line height for better readability
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                if (allSectionsClicked())
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => taxForm()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 140, 82, 255),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            0.1, // Wider padding
                        vertical: MediaQuery.of(context).size.width *
                            0.04, // Taller padding
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width *
                            0.7, // 70% of screen width
                        MediaQuery.of(context).size.width *
                            0.15, // 15% of screen width
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
              ],
            ),
            // Exit Button
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 8,
                      totalPages: 11,
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
