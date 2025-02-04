import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-bookshelf.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Coin4slider());
}

class Coin4slider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliderPage(),
    );
  }
}

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 0;

  List<String> topImagePaths = [
    'assets/bebe.png',
    'assets/young.png',
    'assets/old.png',
  ];

  List<String> bottomImagePaths = [
    'assets/lowmoney.png',
    'assets/mediummoney.png',
    'assets/mostmoney.png',
  ];

  @override
  Widget build(BuildContext context) {
    int sectionIndex = (_sliderValue / (100 / 3)).floor().clamp(0, 2);

    // Calculate the position of the circle indicator based on _sliderValue
    double circlePosition = (_sliderValue / 100) *
        (MediaQuery.of(context).size.width - 50); // Adjust for image width

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: Stack(
        children: [
          ExitButton(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/wawaparent.png', // Replace with your new image path
                      width: 400, // Adjust width as needed
                      height: 400, // Adjust height as needed
                    ),
                    SizedBox(height: 0), // Spacer for some vertical separation
                    Text(
                      'Age: 5          Age: 13       Age: 20', // Replace with your text
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source',
                          color: Color.fromARGB(255, 120, 112, 222)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200, // Increased height for the Stack container
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Top Image
                                Positioned(
                                  left:
                                      circlePosition - 40, // Adjusted left position
                                  top: 1, // Increased top margin
                                  child: Image.asset(
                                    topImagePaths[sectionIndex],
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                // Bottom Image
                                Positioned(
                                  left:
                                      circlePosition - 40, // Adjusted left position
                                  bottom: 10, // Increased bottom margin
                                  child: Image.asset(
                                    bottomImagePaths[sectionIndex],
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Slider
                          Slider(
                            value: _sliderValue,
                            min: 0,
                            max: 100,
                            divisions: 100,
                            onChanged: (value) {
                              setState(() {
                                _sliderValue = value;
                              });
                            },
                          ),
                          Text('Play Around With the Slider!', style: TextStyle(
                            color: Color.fromARGB(255, 120, 112, 222),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),),
                        ],
                      ),
                    ),
                    // Arrow Button
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          if (Provider.of<ProgressProvider>(context, listen: false).sublevel == 4) {
                            Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 5);
                          }
                          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>  Bookshelf(),
                                      ),
                                    );
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
