import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin18/coin18-page14.dart';

class Coin18Page13 extends StatefulWidget {
  const Coin18Page13({super.key});

  @override
  State<Coin18Page13> createState() => _Coin18Page13State();
}

class _Coin18Page13State extends State<Coin18Page13> {
  final List<String> options = [
    'Insurance',
    'Groceries',
    'Charity',
    'Snacks',
    'Medical',
    'Vacation',
  ];

  final List<String> deductibleAnswers = [
    'Insurance',
    'Charity',
    'Medical',
  ];

  final List<String> nonDeductibleAnswers = [
    'Groceries',
    'Snacks',
    'Vacation',
  ];

  List<String> placedDeductibles = [];
  List<String> placedNonDeductibles = [];

  bool get _isCompleted =>
      placedDeductibles.length == 3 && placedNonDeductibles.length == 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            const Align(
              alignment: Alignment.topRight,
              child: TopBar(
                currentPage: 13,
                totalPages: 16,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xffA79AFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 15,
                      alignment: WrapAlignment.center,
                      children: options.map((text) => block(text)).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dragTargetBox(
                          'Deductible', placedDeductibles, deductibleAnswers),
                      dragTargetBox('Non-Deductible', placedNonDeductibles,
                          nonDeductibleAnswers),
                    ],
                  ),
                ),
                const Spacer(),
                if (_isCompleted)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Coin18Page14(),
                          ),
                        );
                      },
                      child: const Text('Next'),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/wondering_detective_wawa.png',
                          width: 100,
                        ),
                        const SizedBox(width: 10),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -10,
                              left: 20,
                              child: Image.asset(
                                'assets/triangle.png',
                                width: 30,
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff7870DE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  "Why don't you try\nsorting these, Wawa",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget block(String text) {
    return Draggable<String>(
      data: text,
      feedback: Material(
        color: Colors.transparent,
        child: optionBox(text),
      ),
      childWhenDragging: Container(),
      child: optionBox(text),
    );
  }

  Widget optionBox(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff8383E6),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget dragTargetBox(
      String label, List<String> placedList, List<String> correctAnswers) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xffA79AFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return DragTarget<String>(
                  onWillAccept: (data) =>
                      correctAnswers.contains(data!) && placedList.length < 3,
                  onAccept: (data) {
                    setState(() {
                      placedList.add(data);
                      options.remove(data);
                    });
                  },
                  builder: (context, candidateData, rejectedData) {
                    if (index < placedList.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: optionBox(placedList[index]),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: SizedBox(
                          height: 30,
                          width: 90,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xffD6CEFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
