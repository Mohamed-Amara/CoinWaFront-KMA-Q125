import 'package:flutter/material.dart';
import '../../Templates/typing_text.dart';
import './wheel.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class MysteryGiftPage extends StatefulWidget {
  const MysteryGiftPage({super.key});

  @override
  _MysteryGiftPageState createState() => _MysteryGiftPageState();
}

class _MysteryGiftPageState extends State<MysteryGiftPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _handTopPosition;
  int _giftCount = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _handTopPosition = Tween<double>(
      begin: -MediaQuery.of(context).size.height * 0.1,
      end: MediaQuery.of(context).size.height * 0.2,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void grabGift() {
    if (_giftCount >= 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizWheelPage()),
      );
    } else {
      _controller.forward().then((_) {
        _controller.reset();
        _giftCount++;
        if (_giftCount == 1) {
          String title = "Income Tax";
          String description =
              "When you earn money from a job, a portion of it is taken as income tax before you even get paid. The amount depends on how much you make—higher incomes pay more tax. This money goes toward important services like healthcare, schools, public transportation, and government programs that support the country.";
          String imgUrl = "assets/wawaTalk.png";
          _showPopup(title, description, imgUrl); // For gift count 1
        } else if (_giftCount == 2) {
          String title = "Sales Tax";
          String description =
              "Every time you buy something, like clothes, electronics, or even a meal at a restaurant, a percentage of the price is added as sales tax. In Canada, this includes the Goods and Services Tax (GST) and, in some provinces, the Provincial Sales Tax (PST) or the Harmonized Sales Tax (HST). This tax helps fund public services, infrastructure, and government programs.";
          String imgUrl = "assets/wawasale.png";
          _showPopup(title, description, imgUrl); // For gift count 2
        } else if (_giftCount == 3) {
          String title = "Corporate Tax";
          String description =
              "Businesses don’t just keep all the money they make—they have to pay corporate tax on their profits. This tax helps fund public services, government programs, and infrastructure, ensuring that companies contribute to the economy just like individuals do.";
          String imgUrl = "assets/corporatewawa.png";
          _showPopup(title, description, imgUrl); // For gift count 3
        } else if (_giftCount == 4) {
          String title = "Property Tax";
          String description =
              "Homeowners and landowners pay property taxes based on the value of their property. This money is used at the local level to fund schools, road maintenance, emergency services, parks, and other community services that improve neighborhoods and cities.";
          String imgUrl = "assets/building.png";
          _showPopup(title, description, imgUrl); // For gift count 4
        } else if (_giftCount == 5) {
          String title = "Tariffs";
          String description =
              "When products are imported from other countries, the government charges a tax called a tariff. These taxes help protect Canadian businesses by making foreign goods more expensive and generating revenue that can be used for public services and economic development.";
          String imgUrl = "assets/globe.png";
          _showPopup(title, description, imgUrl); // For gift count 5
        }
      });
    }
  }

  void _showPopup(String title, String description, imgUrl) {
    showDialog(
      context: context,
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
                // Title Text
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Row for left bubble and right image
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left bubble placeholder
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xff7870de), // Match color from image
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
                        animationSpeed: const Duration(milliseconds: 8000),
                      ),
                    ),
                    Positioned(
                      right: -15,
                      top: 30,
                      child: Transform.rotate(
                        angle: 90 *
                            (3.1415926535 / 180), // Convert degrees to radians
                        child: Image.asset(
                          'assets/triangle.png',
                          width: 10,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Right image placeholder
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
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double handWidth = (MediaQuery.of(context).size.width * 0.6).clamp(0, 175);
    double leftPosition = (MediaQuery.of(context).size.width - handWidth) / 2;

    return GestureDetector(
      onTap: grabGift,
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 0, // Fixed at the bottom
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width, // Full width
                  height: 350, // Increased size
                  child: Image.asset(
                    'assets/mystery.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Hand Animation at the Top
              AnimatedBuilder(
                animation: _handTopPosition,
                builder: (context, child) {
                  return Positioned(
                    top: _handTopPosition.value, // Closer to the top
                    left: leftPosition,
                    child: GestureDetector(
                      onTap: grabGift,
                      child: Container(
                        width: handWidth,
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: Image.asset(
                          'assets/wawahand.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Mystery Box at the Bottom (Bigger Size)
              Positioned(
                bottom: 0, // Fixed at the bottom
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width, // Full width
                  height: 350, // Increased size
                  child: Image.asset(
                    'assets/mystery_box.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Header Section at the Top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Stack(
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
                      alignment: Alignment
                          .center, // Center vertically and horizontally
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 140, 82, 255),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "GRAB THE MYSTERY GIFT",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36, // Increased font size for more impact
                          fontWeight: FontWeight.bold,
                          fontFamily: "Source",
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 4,
                        totalPages: 6,
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
