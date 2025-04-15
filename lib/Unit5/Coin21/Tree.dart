import 'package:flutter/material.dart';
import '../../Templates/exit_button.dart';
import '../../Templates/popup.dart';
import '../../Templates/topbar.dart';
import './investmentGrowth.dart';
import './quiz.dart';
class TreeInvest extends StatefulWidget {
  const TreeInvest({super.key});

  @override
  State<TreeInvest> createState() => _TreeInvestState();
}

class _TreeInvestState extends State<TreeInvest> {
  int _count =0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children:[
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
                            "Magical Investment Growth",
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 12.5),
                        Image.asset('assets/Unit5/seedwawa.png', width: 120),
                        const SizedBox(width: 15),
                        SppeechBubble(
                            'With the right care and time, your money can grow into a great investment!'),
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Centering the image horizontally
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          "assets/Unit5/tree.png",
                          width: 350,
                          height: 270,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_count ==1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage()),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2f008d),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  )
                ],
              ),
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 1,
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

