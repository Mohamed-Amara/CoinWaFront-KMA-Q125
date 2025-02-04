import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-catchgame1.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-savinggoal.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-parentslide.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';

class Coin4parent extends StatelessWidget {
  const Coin4parent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Coin4slider(),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  height: 190,
                  width: 800,
                  decoration: BoxDecoration(
                    color: Color(0xff8483E4), // Container background color
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20), // Rounded corners
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/parentglow.png', // Path to the new image
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 20), // Space between image and text
                      Expanded(
                        child: Text(
                          'Child Savings Account',
                           textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Source',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height:40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Image.asset('assets/canada_flag.png', width: 135,),
                                  const SizedBox(height: 20),
                                  Text('Registered Education\nSavings Plan (RESP)', 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6327db),
                                    fontSize: 18,
                                  ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 5),
                              Column(
                                children: [
                                  Image.asset('assets/america_flag.png', width: 130,),
                                  const SizedBox(height: 45),
                                  Text('529 Plan', 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6327db),
                                    fontSize: 20,
                                  ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 40),
                          WawaTalking("Both of these saving plans allow your parents to save money for you until you are older!", 'assets/wawaTalk.png')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ExitButton()
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin4parent(),
  ));
}
