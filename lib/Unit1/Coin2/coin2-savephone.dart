import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-savinggoal.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';
// Import the utility file

class Coin2Savephone extends StatelessWidget {
  const Coin2Savephone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: GestureDetector(
        onTap: () {
          if (Provider.of<ProgressProvider>(context, listen: false).level == 2){
            Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 4);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CatchIntro1(),
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xff8483E4), // Container background color
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20), // Rounded corners
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 60, left: 45, right: 45, bottom: 20),
                  child: const Text(
                    'Great Choice! Using your\nsavings prevents debt!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Source',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Adjust the height here
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.03), // Reduced spacing
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/coin2phone.png',
                                width: 350,
                                fit: BoxFit.fill,
                              ),
                              const Text(
                                textAlign: TextAlign.center,
                                "Even if you have less\nsaved money, you won't\nhave to worry",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color(0xff5E17EB),
                                ),
                                ),
                                const SizedBox(height: 20),
                                Image.asset(
                                'assets/wawaRelax.png',
                                width: 250,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50), // Adjusted spacing 
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //ExitButton(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin2Savephone(),
  ));
}
