import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-template.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/matching-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

void main() => runApp(const Coin2Select());

class Coin2Select extends StatefulWidget {
  const Coin2Select({super.key});

  @override
  State<Coin2Select> createState() => _Coin2SelectState();
}

class _Coin2SelectState extends State<Coin2Select> {
  final List<Savings> savingsList = [
    Savings(
      title: 'EMERGENCY FUND!',
      iconTitle: 'assets/alarm.png',
      paragraph:
          'An emergency fund is money set aside to cover unexpected costs! It provides a safety net in case things go wrong!',
      scenarioImage: 'assets/scenario_alarm.png',
    ),
    Savings(
      title: 'BIG PURCHASES',
      iconTitle: 'assets/cart.png',
      paragraph:
          'Saving allows you to eventually buy expensive items like a new phone, a computer, or a car without borrowing!',
      scenarioImage: 'assets/scenario_cart.png',
    ),
    Savings(
      title: 'EDUCATION',
      iconTitle: 'assets/grad.png',
      paragraph:
          'Saving for education can help pay for college, training, or other learning opportunities!',
      scenarioImage: 'assets/scenario_grad.png',
    ),
    Savings(
      title: 'FUTURE PLANS',
      iconTitle: 'assets/calendar.png',
      paragraph:
          "Whether it's starting a business, traveling, or buying a home, saving helps you prepare for future goals!",
      scenarioImage: 'assets/scenario_calendar.png',
    ),
    Savings(
      title: 'PEACE OF MIND',
      iconTitle: 'assets/peace.png',
      paragraph:
          'Knowing you have money saved reduces stress and worry about financial problems.',
      scenarioImage: 'assets/scenario_peace.png',
    ),
    Savings(
      title: 'AVOIDING DEBT',
      iconTitle: 'assets/hammer.png',
      paragraph:
          'Saving helps you avoid borrowing money and getting into debt, which can become costly in the future!',
      scenarioImage: 'assets/scenario_hammer.png',
    ),
    // Add more Savings objects as needed
  ];

  
  List<MatchingPair> matchingPairs = [
  MatchingPair(
    scenario: 'Your unexpected medical bill',
    benefit: 'Build an emergency fund',
  ),
  MatchingPair(
    scenario: "You're Retiring",
    benefit: 'Build a long-term life savings account',
  ),
  MatchingPair(
    scenario: "Your University/College Tuition",
    benefit: 'Have an education savings account',
  ),
  MatchingPair(
    scenario: 'You go on vacation',
    benefit: 'Save money for leisure/recreation',
  ),
  MatchingPair(
    scenario: 'You buy a house',
    benefit: 'Save for a large one-time payment',
  )
  ];

  Set<int> selectedIndices = {};
   bool allSelected = false;

  @override
  Widget build(BuildContext context) {
    
    allSelected = selectedIndices.length == savingsList.length;
    Color colorCode = const Color(0x77cec7ff);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TopBar(
                              currentPage: 1,
                              totalPages: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, ),
                      child: Image.asset(
                        'assets/wawacalendar.png',
                        width: 330, // Adjust width as needed
                        height: 330, // Adjust height as needed
                      ),
                    ),
                    Expanded(
                        child: AnimatedContainer(
                      width: 280,
                      duration: const Duration(seconds: 2),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(25.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two icons per row
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 1, // Adjust as needed
                        ),
                        itemCount: savingsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!selectedIndices.contains(index)){
                                  selectedIndices.add(index);
                                }
                             
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Information(saving: savingsList[index]),
                                ),
                              );
                            },
                            child: Container(
                              width: 120, // Adjust width as needed
                              height: 120, // Adjust height as needed
                              decoration: BoxDecoration(
                                color: selectedIndices.contains(index)? const Color.fromARGB(255, 133, 114, 255) : colorCode,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 0,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  savingsList[index].iconTitle,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
                    Visibility(
                    visible: allSelected,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (Provider.of<ProgressProvider>(context, listen: false).level == 2){
                  Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 2);
                }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Matching(
                                  matchingPairs: matchingPairs, isRepeat: false,
                                ),
                              ),
                          );
                        },
                        child: const Text('Next'),
                        
                      ),
                    ),
                    
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
