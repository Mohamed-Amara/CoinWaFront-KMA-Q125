import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-bookshelf.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SavingsAccountPage extends StatefulWidget {
  const SavingsAccountPage({super.key});

  @override
  _SavingsAccountPageState createState() => _SavingsAccountPageState();
}

class _SavingsAccountPageState extends State<SavingsAccountPage> {
  double initialDeposit = 1000.0;
  int duration = 20; // in years
  double interestRate = 5.0; // Annual interest rate

  @override
  Widget build(BuildContext context) {
    final compoundingData = getCompoundingData();
    final simpleData = getSimpleData();
    final compoundAmount = compoundingData.last.amount;
    final simpleAmount = simpleData.last.amount;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: AppBar(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExitButton(),
                  Text(
                    'Explore The Difference!',
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            backgroundColor: Color(0xff7870DE),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Description(
                'Learn how your savings grow over time with interest! Play around with the sliders.',
                false),
            const SizedBox(height: 20),
            const Text('Choose How Much You Want to Invest', style: TextStyle(fontWeight: FontWeight.w500),),
            Slider(
              value: initialDeposit,
              min: 0,
              max: 5000,
              divisions: 100,
              label: '\$${initialDeposit.toStringAsFixed(0)}',
              onChanged: (value) {
                setState(() {
                  initialDeposit = value;
                });
              },
              activeColor: Color(0xff6327db),
              inactiveColor: Color.fromARGB(255, 179, 179, 179),
            ),
            const Text('Duration (years)', style: TextStyle(fontWeight: FontWeight.w500)),
            Slider(
              value: duration.toDouble(),
              min: 1,
              max: 50,
              divisions: 49,
              label: '${duration.toString()} years',
              onChanged: (value) {
                setState(() {
                  duration = value.toInt();
                });
              },
              activeColor: Color(0xff6327db),
              inactiveColor: Color.fromARGB(255, 179, 179, 179),
            ),
            const Text('Annual Interest Rate (%)', style: TextStyle(fontWeight: FontWeight.w500)),
            Slider(
              value: interestRate,
              min: 0,
              max: 10,
              divisions: 100,
              label: '${interestRate.toStringAsFixed(1)} %',
              onChanged: (value) {
                setState(() {
                  interestRate = value;
                });
              },
              activeColor: Color(0xff6327db),
              inactiveColor: Color.fromARGB(255, 179, 179, 179),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 248, 239),
                  borderRadius: BorderRadius.circular(10)),
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(
                  title: AxisTitle(
                    text: 'Years',
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  axisLine: AxisLine(color: Colors.black),


                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold), // Added this line
                ),
                primaryYAxis: NumericAxis(
                  title: AxisTitle(
                    text: 'Savings (\$)',
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  axisLine: AxisLine(color: Colors.black),


                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold), // Added this line
                ),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold), // Added this line
                ),
                series: <ChartSeries>[
                  LineSeries<SavingsData, int>(
                    dataSource: compoundingData,
                    xValueMapper: (SavingsData data, _) => data.year,
                    yValueMapper: (SavingsData data, _) => data.amount,
                    name: 'Compound Interest',
                    color: Colors.blue,
                  ),
                  LineSeries<SavingsData, int>(
                    dataSource: simpleData,
                    xValueMapper: (SavingsData data, _) => data.year,
                    yValueMapper: (SavingsData data, _) => data.amount,
                    name: 'Simple Interest',
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'After ',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '$duration',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' years ...',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Simple interest: you have ',
                style: const TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: '\$${simpleAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Compound interest: you have ',
                style: const TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  TextSpan(
                    text: '\$${compoundAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: () {
                    if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 2) {
                      Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 3);
                    }
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Bookshelf(),
                          ),
                        );
                  }, child: const Text('Continue')),
            )
          ],
        ),
      ),
    );
  }

  List<SavingsData> getCompoundingData() {
    List<SavingsData> data = [];
    double amount = initialDeposit;
    double monthlyInterestRate = (interestRate / 100) / 12;

    for (int year = 0; year <= duration; year++) {
      data.add(SavingsData(year, amount));
      for (int month = 0; month < 12; month++) {
        amount *= (1 + monthlyInterestRate);
      }
    }
    return data;
  }

  List<SavingsData> getSimpleData() {
    List<SavingsData> data = [];
    double amount = initialDeposit;
    double annualInterestRate = interestRate / 100;

    for (int year = 0; year <= duration; year++) {
      data.add(SavingsData(year, amount));
      amount += initialDeposit * annualInterestRate;
    }
    return data;
  }
}

class SavingsData {
  final int year;
  final double amount;

  SavingsData(this.year, this.amount);
}

Widget Description(String description, bool isLeft) {
  return Center(
    child: SizedBox(
      width: 350,
      child: Column(
        children: [
          // First Row (Right Side)
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Align to right
            children: [
              Stack(
                clipBehavior: Clip.none, // Allow the triangle to overflow
                children: [
                  Positioned(
                    bottom: -15,
                    left: 30,
                    child: Image.asset('assets/triangle.png', width: 35),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xff7870DE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 8),
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.2,
                            color: Color.fromARGB(255, 248, 248, 248),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Second Row (Left Side)
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align to left
            children: [
              Image.asset('assets/wawaTalk.png', width: 110),
            ],
          ),
        ],
      ),
    ),
  );
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Savings Account App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SavingsAccountPage(),
    ),
  );
}
