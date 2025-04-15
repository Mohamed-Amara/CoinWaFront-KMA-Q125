import 'package:flutter/material.dart';
import '../../Templates/exit_button.dart';
import '../../Templates/topbar.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../Templates/typing_text.dart';
import 'expontential-graph.dart';
import '../../Templates/popup.dart';


Widget Bubble(String description) {
  return Stack(
    clipBehavior: Clip.none, // Allow the triangle to overflow
    children: [
      Positioned(
        right: -15,
        top: 30,
        child: Transform.rotate(
          angle: -90 * (3.1415926535 / 180), // Convert degrees to radians
          child: Image.asset('assets/Unit5/blue-triangle.png', width: 35),
        ),
      ),
      Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xff57beda),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: TypingText(
              text: description,
              textAlign: TextAlign.center,
              animationSpeed: const Duration(milliseconds: 3000),
              style: const TextStyle(
                height: 0.8,
                color: Color.fromARGB(255, 248, 248, 248),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class SavingScreen extends StatefulWidget {
  @override
  _SavingScreenState createState() => _SavingScreenState();

}

class _SavingScreenState extends State<SavingScreen>{
  double _sliderValue = 0;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    double currentAmount = _sliderValue;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        if(_count ==1){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InvestingScreen()),
          );
        }
        else{
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomPopup(
                title: "Yap",
                description: "Yap",
                imgUrl: "wawaConfused.png",
              );
            },
          );
        }
        setState(() {
          _count +=1;
        });
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFDF0DC),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
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
                              "What is Investing",
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text(
                      "Direct Savings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 300,
                        child: LineChart(
                          LineChartData(
                            backgroundColor: Colors.white,
                            minY: 0,
                            maxY: 1000,
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              horizontalInterval: 200,
                              getDrawingHorizontalLine: (value) => FlLine(
                                color: Colors.grey.shade200,
                                strokeWidth: 1,
                              ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(color: Colors.black26),
                            ),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 40,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      "\$${value.toInt()}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'Source',
                                      ),
                                    );
                                  },
                                ),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 2,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      "Year ${value.toInt()}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'Source',
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                isCurved: true,
                                color: Color.fromARGB(255, 76, 86, 175), // Matches bar chart
                                barWidth: 5,
                                isStrokeCapRound: true,
                                dotData: FlDotData(show: false),
                                spots: List.generate(
                                  11,
                                      (i) => FlSpot(i.toDouble(), _sliderValue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 1000,
                      divisions: 100,
                      label: "\$${_sliderValue.toInt()}",
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue= value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Start : \$${_sliderValue.toStringAsFixed(0)}\nIn 10 years: \$${_sliderValue.toStringAsFixed(0)}",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 12.5),
                          Bubble(
                              'See what happens to your money when you save it!Tap to find Out more!!'),
                          const SizedBox(width: 10),
                          Image.asset('assets/Unit5/gene.png', width: 100),
                        ]),
                  ],
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
