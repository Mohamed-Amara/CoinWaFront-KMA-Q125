import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-template.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/matching-template.dart';
import 'package:flutter_application_1/Templates/quiz-template.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-quiz1.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

void main() => runApp(const Coin6Select());

class Coin6Select extends StatefulWidget {
  const Coin6Select({super.key});

  @override
  State<Coin6Select> createState() => _Coin6SelectState();
}

class _Coin6SelectState extends State<Coin6Select> {
  final List<AssetsTemplate> assetsList = [
    AssetsTemplate(
      title: 'Money',
      iconTitle: 'assets/Unit 2/money_bag.png',
      paragraph1: 'Money is the most straightforward type of asset!',
      paragraph2:
          "This is because you can use it directly to buy things or pay for services!",
      scenarioImage: 'assets/Unit 2/scenario_money.png',
    ),
    AssetsTemplate(
      title: 'Stuff You Own',
      iconTitle: 'assets/Unit 2/boxstuff.png',
      paragraph1: 'The "stuff you own" includes all your personal belongings.',
      paragraph2:
          "These items have value because they serve various pruposes, including being sold!",
      scenarioImage: 'assets/Unit 2/scenario_boxstuff.png',
    ),
    AssetsTemplate(
      title: 'Investments',
      iconTitle: 'assets/Unit 2/stocks.png',
      paragraph1:
          "Money you've put into stocks, bonds, or other places where it can grow over time.",
      paragraph2:
          "Confused? Don't worry! We will cover investments in a later section!",
      scenarioImage: 'assets/Unit 2/wawaPlant.png',
    ),
    AssetsTemplate(
      title: 'Education',
      iconTitle: 'assets/grad.png',
      paragraph1:
          'Skills and knowledge you gain from school, books, or courses.',
      paragraph2: "These can help you in the future and can be assets!",
      scenarioImage: 'assets/Unit 2/wawaBook.png',
    ),
    // Add more Savings objects as needed
  ];

  Set<int> selectedIndices = {};
  bool allSelected = false;

  @override
  Widget build(BuildContext context) {
    allSelected = selectedIndices.length == assetsList.length;
    Color colorCode = const Color(0x77cec7ff);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 3,
                        totalPages: 5,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: WawaTalking('Pick an example of an ASSET!',
                            'assets/wawaTalk.png')),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 280,
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(25.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two icons per row
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 1, // Adjust as needed
                        ),
                        itemCount: assetsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!selectedIndices.contains(index)) {
                                  selectedIndices.add(index);
                                }
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AssetsInformation(
                                      assets: assetsList[index]),
                                ),
                              );
                            },
                            child: Container(
                              width: 120, // Adjust width as needed
                              height: 120, // Adjust height as needed
                              decoration: BoxDecoration(
                                color: selectedIndices.contains(index)
                                    ? const Color.fromARGB(255, 133, 114, 255)
                                    : colorCode,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 0,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  assetsList[index].iconTitle,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: allSelected,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (Provider.of<ProgressProvider>(context,
                                        listen: false)
                                    .level ==
                                6) {
                              Provider.of<ProgressProvider>(context,
                                      listen: false)
                                  .setSublevel(context, 4);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Coin6Quiz1(isRepeat: false,)),
                            );
                            
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ),
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
