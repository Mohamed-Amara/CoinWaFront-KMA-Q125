import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-page3.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class Coin14Page2Credit extends StatefulWidget {
  const Coin14Page2Credit({super.key});

  @override
  _Coin14Page2CreditState createState() => _Coin14Page2CreditState();
}

class _Coin14Page2CreditState extends State<Coin14Page2Credit> {
  String debitMachineText = "Please hold your card over the reader to pay";
  bool isCardOverMachine = false;
  bool isContinueVisible = false;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        debitMachineText = "Thank you!";
        isContinueVisible = true;
      });
    });
  }

  void _cancelTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        DragTarget(
                          onWillAcceptWithDetails: (data) {
                            _startTimer();
                            return true;
                          },
                          onLeave: (data) {
                            _cancelTimer();
                          },
                          onAcceptWithDetails: (data) {},
                          builder: (context, candidateData, rejectedData) {
                            return Image.asset(
                              'assets/Unit 3/debit_machine.png',
                              width: 250,
                            );
                          },
                        ),
                        Positioned(
                          top: 80,
                          child: Container(
                            width: 150,
                            child: Text(
                              debitMachineText,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Draggable(
                      data: 'creditCard',
                      feedback: Image.asset(
                        'assets/Unit 3/credit_card.png',
                        width: 280,
                      ),
                      childWhenDragging: Container(), // Empty container when dragging
                      child: Image.asset(
                        'assets/Unit 3/credit_card.png',
                        width: 280,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: isContinueVisible,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coin14Page3()),
                );
                      }, child: Text('Continue')))
                  ],
                ),
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
                      totalPages: 7,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
