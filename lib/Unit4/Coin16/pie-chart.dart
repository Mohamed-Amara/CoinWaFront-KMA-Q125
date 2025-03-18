import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import './mystery-gift.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class TaxPieChartPage extends StatefulWidget {
  const TaxPieChartPage({super.key});

  @override
  _TaxPieChartPageState createState() => _TaxPieChartPageState();
}

class _TaxPieChartPageState extends State<TaxPieChartPage> {
  Set<String> clickedSections = {}; // Track clicked sections

  void onPieSectionClicked(String section) {
    if (!clickedSections.contains(section)) {
      setState(() {
        clickedSections.add(section);
      });
      if (section == 'Healthcare') {
        _showPopup(
            'Healthcare',
            'Healthcare and social services use taxes to fund their operations. ',
            'assets/heart.png' // Example icon path
        );
      } else if (section == 'Safety') {
        _showPopup(
            'Safety',
            'Public Safety and Protection is also funded by your taxes from the government...',
            'assets/police_badge.png'
        );
      } else if (section == 'Government') {
        _showPopup(
            'Government',
            'Government spending includes public services, infrastructure, and administration.',
            'assets/government.png'
        );
      } else if (section == 'Education') {
        _showPopup(
            'Education',
            'Education funding covers schools, teachers, and educational programs.',
            'assets/books.png'
        );
      } else if (section == 'Development') {
        _showPopup(
            'Development',
            'Infrastructure is the biggest use of tax dollars. From the roads and sidewalks, to the stoplights, everything is funded by the government through taxes ...',
            'assets/house.png'
        );
      } else if (section == 'Other') {
        _showPopup(
            'Other',
            'hdksljjjjjjjjssjhkfgjhgajhfsagafsjhashjcbjahcsaj',
            'assets/plant.png'
        );
      }

    }
  }
  void _showPopup(String title, String description, String icon) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7), // Transparent black background
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
                      'assets/wawaup.png',
                      width: (MediaQuery.of(context).size.width * 0.25).clamp(0, 150),
                    ),
                    const SizedBox(width: 10), // Space between images
                    Image.asset(
                      icon,
                      width: (MediaQuery.of(context).size.width * 0.25).clamp(0, 150),
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
                Text(
                  description, // Use the description parameter
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
                      Navigator.of(context).pop(); // Close the popup on "Continue"
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

  bool allSectionsClicked() {
    return clickedSections.length == 6; // Total of 5 sections
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(

        child:Stack(
        children: [
          Column(
          children: [
            // Header Section
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
                        'assets/tax.png',
                        width: 90, // Increased size for better balance
                      ),
                      const SizedBox(width: 10), // Space between image and text
                      Flexible(
                        child: Text(
                          "The Main Uses of Taxes",
                          softWrap: true, // Allows text to wrap to the next line
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32, // Increased font size
                            fontWeight: FontWeight.bold,
                            fontFamily: "Source",
                            height: 1.3, // Adjust line height for better readability
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1), // 10% of screen width for padding
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color.fromARGB(255, 140, 82, 255),
            //     padding: EdgeInsets.symmetric(
            //       horizontal: MediaQuery.of(context).size.width * 0.1, // 10% of screen width
            //       vertical: MediaQuery.of(context).size.height * 0.02, // 2% of screen height for vertical padding
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //   ),
            //   child:
            const Text(
                "Click on a Piece of Pie!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            // ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.2),
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Colors.orange,
                    value: 24.5,
                    title: 'Healthcare',
                    radius: (MediaQuery.of(context).size.width * (150 / 400)).clamp(0, 200),
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.red,
                    value: 5.7,
                    title: 'Safety',
                    radius: (MediaQuery.of(context).size.width * (150 / 400)).clamp(0, 200),
                    titlePositionPercentageOffset: 0.7,
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: 15.5,
                    title: 'Government',
                    radius: (MediaQuery.of(context).size.width * (150 / 400)).clamp(0, 200),
                    titlePositionPercentageOffset: 0.7,
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: 13.0,
                    title: 'Education',
                    radius: (MediaQuery.of(context).size.width * (150 / 400)).clamp(0, 200),
                    titlePositionPercentageOffset: 0.7,
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.grey,
                    value: 9.4,
                    title: 'Development',
                    radius: (MediaQuery.of(context).size.width * (150 / 400)).clamp(0, 200),
                    titlePositionPercentageOffset: 0.7,
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.purple,
                    value: 32.0, // Sum of other categories
                    title: 'Other',
                    radius: (MediaQuery.of(context).size.width * (150 / 400)).clamp(0, 200),
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
                sectionsSpace: 2,
                centerSpaceRadius: 0,
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (event is FlTapUpEvent &&
                        pieTouchResponse != null &&
                        pieTouchResponse.touchedSection != null) {
                      final index = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      switch (index) {
                        case 0:
                          onPieSectionClicked('Healthcare');
                          break;
                        case 1:
                          onPieSectionClicked('Safety');
                          break;
                        case 2:
                          onPieSectionClicked('Government');
                          break;
                        case 3:
                          onPieSectionClicked('Education');
                          break;
                        case 4:
                          onPieSectionClicked('Development');
                          break;
                        case 5:
                          onPieSectionClicked('Other');
                          break;
                      }
                    }
                  },
                ),
              ),
            ),
          ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            // Continue Button (if all sections clicked)
            if (allSectionsClicked())
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MysteryGiftPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 140, 82, 255),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1, // Wider padding
                    vertical: MediaQuery.of(context).size.width * 0.04, // Taller padding
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                    MediaQuery.of(context).size.width * 0.15, // 15% of screen width
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
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 3,
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

void main() {
  runApp(const MaterialApp(
    home: TaxPieChartPage(),
  ));
}
