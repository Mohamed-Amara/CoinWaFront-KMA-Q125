import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-quiztemp.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-intro.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-quiz1.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

Widget _block(String text) {
  return Draggable<String>(
    data: text,
    feedback: Material(
      color: Colors.transparent,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff5e17eb),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
          child: Text(
            text,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
    childWhenDragging: Container(),
    child: Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff5e17eb),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
        child: Text(
          text,
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}

class Coin11Drag extends StatefulWidget {
  final bool isRepeat;
  const Coin11Drag({super.key, required this.isRepeat});

  @override
  State<Coin11Drag> createState() => _Coin11DragState();
}

class _Coin11DragState extends State<Coin11Drag> {
  List<String> availableBlocks = [
    'Taking a loan for a gaming console',
    'Educational Loan',
    'Taking a loan to buy a house',
    'Borrowing money for a car that loses value',
    'Taking a loan to invest in appreciating assets'
  ];

  bool isResetVisible = false;
  bool isCheckVisible = false;
  bool isContinueVisible = false;
  bool gotWrong = false;

  List<String> correctGoodDebt = [
    'Educational Loan',
    'Taking a loan to buy a house',
    'Taking a loan to invest in appreciating assets'
  ];

  List<String> correctBadDebt = [
    'Taking a loan for a gaming console',
    'Borrowing money for a car that loses value'
  ];

  List<Widget> goodlist = [];
  List<Widget> badlist = [];

  void _droppedOnGood(String text) {
    setState(() {
      isResetVisible = true;
      goodlist.add(_stillBlock(text));
      availableBlocks.remove(text);
      if (goodlist.length + badlist.length == 5) {
        isCheckVisible = true;
      }
    });
  }

  void _droppedOnBad(String text) {
    setState(() {
      isResetVisible = true;
      badlist.add(_stillBlock(text));
      availableBlocks.remove(text);
      if (goodlist.length + badlist.length == 5) {
        isCheckVisible = true;
      }
    });
  }

  Widget _stillBlock(String description, {Color? color}) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color ?? const Color(0xff5e17eb),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
        child: Text(
          description,
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

 void _checkAnswer() {
  setState(() {
    if (!widget.isRepeat){
      isResetVisible = false;
    }
    
    // Check Good Debt list
    for (int i = 0; i < goodlist.length; i++) {
      final blockText = _extractTextFromWidget(goodlist[i]);
      if (correctGoodDebt.contains(blockText)) {
        goodlist[i] = _stillBlock(blockText, color: Colors.green[900]);
      } else {
        goodlist[i] = _stillBlock(blockText, color: Colors.red[900]);
        if (!gotWrong && !widget.isRepeat){
          onWrongAnswer(context, 11);
          gotWrong = true;
        }
      }
    }

    // Check Bad Debt list
    for (int i = 0; i < badlist.length; i++) {
      final blockText = _extractTextFromWidget(badlist[i]);
      if (correctBadDebt.contains(blockText)) {
        badlist[i] = _stillBlock(blockText, color: Colors.green[900]);
      } else {
        badlist[i] = _stillBlock(blockText, color: Colors.red[900]);
         if (!gotWrong && !widget.isRepeat){
          onWrongAnswer(context, 11);
          gotWrong = true;
        }
      }
    }

    isContinueVisible = true; // Show the continue button
    isCheckVisible = false;   // Hide the check button
  });
}



String _extractTextFromWidget(Widget widget) {
  if (widget is Padding) {
    final container = widget.child;
    if (container is Container) {
      return _extractTextFromContainer(container);
    }
  } else if (widget is Container) {
    return _extractTextFromContainer(widget);
  }
  return '';
}

String _extractTextFromContainer(Container container) {
  final child = container.child;
  if (child is Text) {
    return child.data ?? '';
  } else if (child is Padding) {
    final nestedChild = child.child;
    if (nestedChild is Container) {
      return _extractTextFromContainer(nestedChild);
    } else if (nestedChild is Text) {
      return nestedChild.data ?? '';
    }
  }
  return '';
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    purpleTextBubble(
                        'Drag and drop these blocks to their correct places'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Good Debt',
                                style: TextStyle(
                                    color: Color(0xff5e17eb),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            DragTarget<String>(
                              builder: (BuildContext context,
                                  List<String?> candidateData,
                                  List<dynamic> rejectedData) {
                                return Container(
                                    height: 350,
                                    width: 175,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: candidateData.isNotEmpty
                                            ? const Color.fromARGB(
                                                255, 204, 204, 204)
                                            : const Color(0xffb9b1fa),
                                        border: Border.all(
                                            color: const Color(0xff7870de),
                                            width: 5)),
                                    child: ListView.builder(
                                      itemCount: goodlist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: goodlist[index],
                                        );
                                      },
                                    ));
                              },
                              onAcceptWithDetails: (details) {
                                _droppedOnGood(details.data);
                              },
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Bad Debt',
                                style: TextStyle(
                                    color: Color(0xff5e17eb),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                            DragTarget<String>(
                              builder: (BuildContext context,
                                  List<String?> candidateData,
                                  List<dynamic> rejectedData) {
                                return Container(
                                    height: 350,
                                    width: 175,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: candidateData.isNotEmpty
                                            ? const Color.fromARGB(
                                                255, 204, 204, 204)
                                            : const Color(0xffb9b1fa),
                                        border: Border.all(
                                            color: const Color(0xff7870de),
                                            width: 5)),
                                    child: ListView.builder(
                                      itemCount: badlist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: badlist[index],
                                        );
                                      },
                                    ));
                              },
                              onAcceptWithDetails: (details) {
                                _droppedOnBad(details.data);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                            visible: isResetVisible,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    goodlist.clear();
                                    badlist.clear();
                                    isResetVisible = false;
                                    isContinueVisible = false;
                                    isCheckVisible = false;
                                    availableBlocks = [
                                      'Taking a loan for a gaming console',
                                      'Educational Loan',
                                      'Taking a loan to buy a house',
                                      'Borrowing money for a car that loses value',
                                      'Taking a loan to invest in appreciating assets'
                                    ];
                                  });
                                },
                                child: const Text('Reset'))),
                        Visibility(
                            visible: isCheckVisible,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    _checkAnswer();
                                  },
                                  child: const Text('Check')),
                            )),
                        Visibility(
                            visible: isContinueVisible,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (Provider.of<ProgressProvider>(context, listen: false).level == 11) {
                                    Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 5);
                                  }
                                  if (widget.isRepeat) {
                                          navigateToNextQuestion(context, 11, "Credit Cards");
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const Coin11Quiz1(isRepeat: false,)
                                            ),
                                          );
                                        }
                                },
                                child: const Text('Continue')))
                      ],
                    ),
                    const SizedBox(height: 20),
                    ...availableBlocks.map((block) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _block(block),
                        )),
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
