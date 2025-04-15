import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../Templates/exit_button.dart';
import '../../Templates/popup.dart';
import '../../Templates/topbar.dart';
import './linear-graph.dart';
import './investmentGrowth.dart';

class InvestingScreen extends StatefulWidget {
  @override
  _InvestingScreenState createState() => _InvestingScreenState();

}

class _InvestingScreenState extends State<InvestingScreen>{
  double _sliderValue = 0;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    double annualRate = 0.17; // 17% annual return
    int years = 10;
    double currentAmount = _sliderValue * pow((1 + annualRate), years);
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        if(_count ==1){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => investmentGrowth()),
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
                    "Investment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Inside your widget
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 300,
                      child: LineChart(
                        LineChartData(
                          backgroundColor: Colors.white,
                          minY: 0,
                          maxY: 10000, // Adjust based on expected max output
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            horizontalInterval: 2000,
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
                              color: const Color.fromARGB(255, 76, 86, 175),
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              spots: List.generate(
                                11,
                                    (i) {
                                  double principal = _sliderValue;
                                  double rate = 0.17;
                                  double amount = principal * pow((1 + rate), i);
                                  return FlSpot(i.toDouble(), amount);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                    "Start : \$${_sliderValue.toStringAsFixed(0)}\nIn 10 years: \$${currentAmount.toStringAsFixed(0)}",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 12.5),
                        Bubble(
                            'Now try Investing it and see what happens over time! Tap to find Out more!!'),
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
