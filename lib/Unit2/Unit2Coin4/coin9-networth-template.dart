import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-smart_game.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-page3-part1.dart';
import 'package:flutter_application_1/Templates/animation_util.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

class Coin9Template extends StatefulWidget {
  final String imagename;
  final String name;
  final int assets;
  final int liabilities;
  final Widget route;
  final int sublevel;
  final bool isRepeat;

  const Coin9Template(
      {super.key,
      required this.imagename,
      required this.name,
      required this.assets,
      required this.liabilities,
      required this.route,
      required this.sublevel, required this.isRepeat});

  @override
  State<Coin9Template> createState() => _Coin9TemplateState();
}

class _Coin9TemplateState extends State<Coin9Template> {
  final myController = TextEditingController();
  bool isCorrect = false;
  bool isVisible = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(children: [
                    Image.asset(widget.imagename, width: 300),
                    const SizedBox(height: 20),
                    Text('${widget.name} has:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xff5e17eb),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Color(0xff5e17eb),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              widget.name == "The Icon"
                                  ? '\$${widget.assets} million in assets'
                                  : '\$${widget.assets} in assets',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Color(0xff5e17eb),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              widget.name == "The Icon"
                                  ? '\$${widget.liabilities} million in liabilities'
                                  : '\$${widget.liabilities} in liabilities',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                        widget.name == "The Icon"
                            ? 'What is their Net Worth\nin millions?'
                            : 'What is their Net Worth?',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xff5e17eb),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("\$",
                            style: TextStyle(
                              color: Color(0xff5e17eb),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: myController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'-?\d*'),
                                ),
                              ],
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter the amount',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isVisible = true;
                                if (myController.text ==
                                    (widget.assets - widget.liabilities)
                                        .toString()) {
                                  isCorrect = true;
                                } else {
                                  isCorrect = false;
                                  if (!widget.isRepeat){
                                    _onWrongAnswer(context);
                                  }
                                }
                              });
                            },
                            child: const Text('check'))
                      ],
                    ),
                    Visibility(
                        visible: isVisible,
                        child: isCorrect
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Correct!",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {

                                      if (widget.isRepeat){
                                        navigateToNextQuestion(context, 9, "Net Worth");
                                      }
                                      else{
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                widget.route),
                                       );

                                      }
                                      
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.green[800],
                                      backgroundColor: const Color.fromARGB(
                                          255,
                                          177,
                                          255,
                                          180), // Set the text color
                                    ),
                                    child: const Text("Continue"),
                                  ),
                                ],
                              )
                            : const Text("Incorrect!",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))),
                  ]),
                ),
              ),
            ),
            ExitButton(),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: widget.sublevel,
                      totalPages: 10,
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

  void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 9) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }
}
