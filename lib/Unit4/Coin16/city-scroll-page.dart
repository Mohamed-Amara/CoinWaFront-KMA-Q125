import 'package:flutter/material.dart';
import './pie-chart.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class CityScrollPage extends StatefulWidget {
  @override
  _CityScrollPageState createState() => _CityScrollPageState();
}

class _CityScrollPageState extends State<CityScrollPage> {
  final List<String> _visitedBuildings = [];
  final List<String> _allBuildings = [
    'Health Services',
    'Education',
    'Development',
    'Public Safety',
    'Public Transit',
    'The Government',
  ];

  // ✅ Popup Function
  void _showPopup(BuildContext context, String title, String description) {
    if (!_visitedBuildings.contains(title)) {
      _visitedBuildings.add(title);
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
                // 🏷️ Title
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
                ),
                const SizedBox(height: 20),

                // 🏢 Right Image
                Image.asset(
                  "assets/suprisedwawa.png", // Added correct file extension
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                // ✅ Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (_visitedBuildings.length == _allBuildings.length) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaxPieChartPage(),
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
                      _visitedBuildings.length == _allBuildings.length
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
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enables horizontal scrolling
            child: Stack(
              children: [
                Image.asset(
                  "assets/cityroad.png", // Fixed path syntax
                  width: 2800, // Adjust to match total row width
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover, // Ensures the background covers the area
                ),
                Positioned(
                  bottom: 0, // Align at the bottom
                  child: SizedBox(
                    width: 2800, // Adjust to fit all buildings horizontally
                    height: MediaQuery.of(context).size.height, //this line
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBuilding(
                            context,
                            'Health Services',
                            'assets/hospital.png',
                            ' Taxes help fund hospitals, doctors, nurses, and medical equipment, ensuring everyone has access to essential healthcare services.'),
                        _buildBuilding(
                            context,
                            'Education',
                            'assets/school.png',
                            'Schools, teachers, supplies, and learning resources are all supported by taxes, helping students get a quality education.'),
                        _buildBuilding(
                            context,
                            'Development',
                            'assets/construction.png',
                            'Taxes help fund the construction and maintenance of roads, bridges, parks, and other public infrastructure, ensuring communities stay safe, functional, and growing.'),
                        _buildBuilding(
                            context,
                            'Public Safety',
                            'assets/police.png',
                            'Police, firefighters, and emergency services are funded by taxes to keep communities safe, respond to emergencies, and protect citizens in times of need.'),
                        _buildBuilding(
                            context,
                            'Public Transit',
                            'assets/busstop.png',
                            'Taxes help support buses, subways, and trains, making transportation more accessible, reliable, and affordable for everyone.'),
                        _buildBuilding(
                            context,
                            'The Government',
                            'assets/govern.png',
                            ' Taxes pay for government operations, including lawmakers, public programs, and essential services that keep the country running smoothly.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 🚗 Static Car with Character (Always Visible)
          Positioned(
            bottom: 20,
            left: 0, // Centers the car
            right: 0,
            child: Center(
              child: CarWithCharacter(),
            ),
          ),
          Positioned(
            top: 0, // Fix header to the top of the screen
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
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 140, 82, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Let's Take a Trip Down Tax Road",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
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
                    currentPage: 2,
                    totalPages: 6,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🏢 Function to Build Each Building with Label
  Widget _buildBuilding(BuildContext context, String label, String assetPath,
      String description) {
    return GestureDetector(
      onTap: () {
        _showPopup(context, label, description);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          // 📍 Purple Label for Each Building
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 40), // Space between label and building
          // 🏢 Building Image
          Container(
            width: 350,
            height: 250,
            margin: EdgeInsets.symmetric(
                horizontal: 50), // Spacing between buildings
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetPath), // Building image from assets
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: (5 / 27.5) * MediaQuery.of(context).size.height)
        ],
      ),
    );
  }
}

// 🚗 Character and Car Widget (Always in Center)
class CarWithCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Align character on top of car
      children: [
        // 🚗 Car Image
        Image.asset(
          'assets/wawadriving.png',
          width: 300,
          height: 200,
        ),
      ],
    );
  }
}
