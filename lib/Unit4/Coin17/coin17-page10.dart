import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page11.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-page11.dart';

class TaxBracketGame extends StatefulWidget {
  @override
  _TaxBracketGameState createState() => _TaxBracketGameState();
}

class _TaxBracketGameState extends State<TaxBracketGame> {
  double totalMoney = 0;
  double totalTax = 0;
  Set<int> collectedBrackets = {}; // Stores indices of collected brackets

  final List<Map<String, dynamic>> taxBrackets = [
    {
      "title": "Bracket 5",
      "range": "\$200k+",
      "rate": "35%",
      "amount": 50000,
      "tax": 17500,
      "image": "assets/bracket5coin.png",
      "description":
          "You have made it to the final tax bracket! Welcome to tax bracket 5, where any money you earn over \$200k is taxed at around 35%! You are among the top earners and therefore you are able to contribute a great amount society with your tax dollars which help lots of people!"
    },
    {
      "title": "Bracket 4",
      "range": "\$150k - \$200k",
      "rate": "30%",
      "amount": 50000,
      "tax": 15000,
      "image": "assets/bracket4coin.png",
      "description":
          "Welcome to the fourth tax bracket! You have earned an additional \$50k! This new \$50k you have earned is taxed at around 30%! Dont worry though just because your taxes are getting higher isnt all bad. Higher taxes also means higher deductions which you will learn about later!"
    },
    {
      "title": "Bracket 3",
      "range": "\$100k - \$150k",
      "rate": "25%",
      "amount": 50000,
      "tax": 12500,
      "image": "assets/bracket3coin.png",
      "description":
          "Wow you're on a roll! You have earned \$50k! Welcome to the third tax bracket where your income is taxed at around 25%. Youll notice that as you make more, you start to pay more tax on your higher income!"
    },
    {
      "title": "Bracket 2",
      "range": "\$50k - \$100k",
      "rate": "20%",
      "amount": 50000,
      "tax": 10000,
      "image": "assets/bracket2coin.png",
      "description":
          "Youve made another \$50k! Income from \$50k-\$100k is taxed at around 20%. Youll notice that this tax only applies to the money you make over \$50k, not the intial \$50k you made which is still taxed at 15%!"
    },
    {
      "title": "Bracket 1",
      "range": "\$0 - \$50k",
      "rate": "15%",
      "amount": 50000,
      "tax": 7500,
      "image": "assets/bracket1coin.png",
      "description":
          "Youve Collected your first Income! Any income starting from \$0-\$50k is taxed at around 15%! This is the first  \$50k you have earned and it is the first step in your journey to learning about the tax brackets!"
    },
  ];

  void _checkCompletion() {
    if (collectedBrackets.length == taxBrackets.length) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents closing by tapping outside
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xffeae9ff), // Purple background
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Congratulations!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "You've completed the level!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SourceSans',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaxComparisonPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void collectMoney(int index) {
    if (!collectedBrackets.contains(index)) {
      setState(() {
        totalMoney += taxBrackets[index]["amount"];
        totalTax += taxBrackets[index]["tax"];
        collectedBrackets.add(index); // Mark as collected
      });

      showDialog(
        context: context,
        barrierDismissible: false, // Prevents dismissal when tapping outside
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xffeae9ff), // Purple background
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    taxBrackets[index]["title"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Source',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Color(0xff7870de),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      taxBrackets[index]["description"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 248, 248),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSans'),
                    ),
                  ),
                  Image.asset('assets/wawaTalk.png',
                      width: 275, fit: BoxFit.cover),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _checkCompletion();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 207, 254), //rgb(69, 207, 254)
      body: Stack(
        children: [
          // Scrollable content (Sky + Ladder)
          SingleChildScrollView(
            reverse: true,
            child: Stack(
              children: [
                // Background Sky
                Column(
                  children: [
                    Image.asset("assets/longsky.png", fit: BoxFit.cover),
                  ],
                ),

                // Ladder (Moves with scrolling but separate from background)
                Positioned(
                  left: 5,
                  child: Column(
                    children: [
                      Image.asset("assets/longladder.png",
                          fit: BoxFit.fitWidth),
                    ],
                  ),
                ),

                // Tax Brackets & Money Icons
                Positioned.fill(
                  child: Column(
                    children: List.generate(taxBrackets.length, (index) {
                      var bracket = taxBrackets[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 5, left: 125),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Money icon (Clickable once)
                            GestureDetector(
                              onTap: () => collectMoney(index),
                              child: Opacity(
                                opacity: collectedBrackets.contains(index)
                                    ? 0.5 // Faded after clicking
                                    : 1.0,
                                child:
                                    Image.asset(bracket["image"], width: 300),
                              ),
                            ),

                            // Show text boxes permanently once clicked (OVERLAY, not pushing down)
                            if (collectedBrackets.contains(index))
                              Positioned(
                                top: 90, // Fine-tune positioning
                                child: Column(
                                  children: [
                                    _infoBox(
                                        bracket["title"],
                                        "Range: ${bracket["range"]}",
                                        "Rate: ${bracket["rate"]}"),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Static Character on the Ladder
          Positioned(
            left: 10,
            bottom: 200,
            child: Image.asset("assets/ladderwawa.png", width: 200),
          ),

          // Floating UI for Total Money & Tax
          Positioned(
            bottom: 20,
            left: 150,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 162, 98, 247),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Text(
                      "Total Money: \$${(totalMoney / 1000).toStringAsFixed(1)}k",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 58, 29, 112),
                          fontSize: 18,
                          fontFamily: 'Source')),
                  Text(
                      "Total Taxes: \$${(totalTax / 1000).toStringAsFixed(1)}k",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 8, 9, 75),
                          fontSize: 18,
                          fontFamily: 'Source')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create text boxes
  Widget _infoBox(String bracket, String range, String rate) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 48, 29, 156),
              borderRadius: BorderRadius.circular(10)),
          child: Text(bracket,
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: 'Source')),
        ),
        Row(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 93, 65, 255),
                borderRadius: BorderRadius.circular(10)),
            child: Text(range,
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontFamily: 'Source')),
          ),
          SizedBox(width: 10),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 93, 65, 255),
                borderRadius: BorderRadius.circular(10)),
            child: Text(rate,
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontFamily: 'Source')),
          ),
        ]),
      ],
    );
  }
}
