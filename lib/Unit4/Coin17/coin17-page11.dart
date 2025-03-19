import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page12.dart';

class TaxComparisonPage extends StatefulWidget {
  const TaxComparisonPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaxComparisonPageState createState() => _TaxComparisonPageState();
}

class _TaxComparisonPageState extends State<TaxComparisonPage> {
  double income = 50000; // Default income
  double afterTaxIncome = 0;

  double calculateAfterTax(double income) {
    double remainingIncome = income;
    double taxPaid = 0;

    List<Map<String, dynamic>> taxBrackets = [
      {"limit": 50000, "rate": 0.15},
      {"limit": 100000, "rate": 0.20},
      {"limit": 150000, "rate": 0.25},
      {"limit": 200000, "rate": 0.30},
      {"limit": double.infinity, "rate": 0.35},
    ];

    double prevLimit = 0;
    for (var bracket in taxBrackets) {
      if (remainingIncome > 0) {
        double taxableAmount =
            (remainingIncome > (bracket["limit"] - prevLimit))
                ? (bracket["limit"] - prevLimit)
                : remainingIncome;
        taxPaid += taxableAmount * bracket["rate"];
        remainingIncome -= taxableAmount;
        prevLimit = bracket["limit"];
      } else {
        break;
      }
    }

    return income - taxPaid;
  }

  @override
  Widget build(BuildContext context) {
    afterTaxIncome = calculateAfterTax(income);

    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: Column(
        children: [
          // Updated Banner
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
                    Image.asset(
                      'assets/coin17headercash.png',
                      width: 130,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Compare Before & After Tax",
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

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ".",
                style: TextStyle(
                    color: Colors.transparent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source',
                    fontSize: 25),
              ),
              // Directly wrap the text in Center and use textAlign to center it
              Center(
                child: Text(
                  "Explore how much income tax you might pay based on your income!",
                  textAlign:
                      TextAlign.center, // Center the text even if wrapped
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source',
                      fontSize: 24),
                ),
              ),
              Text(
                "Use the Slider Below!",
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source',
                    fontSize: 20),
              ),
              SizedBox(height: 40),
            ],
          ),

          // Bar Chart with Vertical Axis Labels
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30), // Adds side margins
            child: SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                        toY: income / 1000,
                        color: const Color.fromARGB(255, 76, 86, 175),
                        width: 100,
                        borderRadius: BorderRadius.circular(8),
                      )
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        toY: afterTaxIncome / 1000,
                        color: const Color.fromARGB(255, 87, 39, 176),
                        width: 100,
                        borderRadius: BorderRadius.circular(8),
                      )
                    ]),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            "\$${(value).toInt()}k",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Source'),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: false,
                    )),
                    topTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: false,
                    )),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value == 0 ? "\$ Before" : "\$ After",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Source'),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30), // More spacing for potential future text

          // Display Before & After Tax Values
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Before Tax: \$${income.toInt()}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source'),
                ),
                Text(
                  "After Tax: \$${afterTaxIncome.toInt()}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source'),
                ),
                const SizedBox(height: 10),

                // Slider Input
                Text(
                  "Use the slider to change your Income!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: income,
                  min: 0,
                  max: 1000000,
                  divisions: 100,
                  label: "\$${income.toInt()}",
                  onChanged: (double value) {
                    setState(() {
                      income = value;
                      afterTaxIncome = calculateAfterTax(value);
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20), // Extra space for spacing

          // Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color.fromARGB(255, 92, 39, 176),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
