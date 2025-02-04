import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-savinggoal.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';
// Import the utility file

class Coin2debt extends StatelessWidget {
  const Coin2debt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: Stack(
        children: [
          GestureDetector(
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
            child: Column(
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
                  padding: const EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 20),
                  child: const Text(
                    'Borrowing puts you in debt,\nwhich means you have to\npay it back later!',
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
                        const SizedBox(height: 20),
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/debtrock.png',
                                width: 350,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                textAlign: TextAlign.center,
                                "It's better to use your\nemergeny fund or savings!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color(0xff5E17EB),
                                ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30), // Adjusted spacing
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
         // ExitButton()
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Coin2debt(),
  ));
}
