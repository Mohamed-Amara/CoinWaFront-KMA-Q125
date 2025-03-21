import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin19/summary.dart';
import 'package:provider/provider.dart';
import '../../Providers/lives_provider.dart';
import '../../Providers/progress_provider.dart';
import '../../Templates/animation_util.dart';

class TaxJeopardy extends StatefulWidget {
  const TaxJeopardy({super.key});

  @override
  _TaxJeopardyState createState() => _TaxJeopardyState();
}

class _TaxJeopardyState extends State<TaxJeopardy> {
  bool _continue = false;
  int _personValue = 0;
  int _clickCount = 0;
  // add colours and clicked function
  final Map<String, List<Map<String, dynamic>>> _jeopardy = {
    "Documents": [
      {
        "index": 0,
        "value": 100,
        "question":
            "What document shows proof of something you bought that might help with your taxes?",
        "options": [
          "Library Card",
          "Receipt",
          "Grocery List",
          "School Transcript"
        ],
        "answer": "Receipt",
        "category": "Documents",
        "color": Colors.pink,
        "clicked": false,
      },
      {
        "index": 1,
        "value": 200,
        "question":
            "Which of these documents might you need when filing your taxes?",
        "options": [
          "Movie Ticket",
          "Bank Savings Statement",
          "Bus Fare Ticket",
          "Tax Penalty Notice"
        ],
        "answer": "Bank Savings Statement",
        "category": "Documents",
        "color": Colors.pink,
        "clicked": false,
      },
      {
        "index": 2,
        "value": 300,
        "question":
            "If you earn money from a savings account, what document might you need for taxes?",
        "options": [
          "School Transcript",
          "Bank Statement",
          "Concert Ticket",
          "Letter of Admission"
        ],
        "answer": "Bank Statement",
        "category": "Documents",
        "color": Colors.pink,
        "clicked": false,
      }
    ],
    "Ways to File Taxes": [
      {
        "index": 3,
        "value": 200,
        "question": "What is the fastest way to file taxes?",
        "options": [
          "Mailing paper forms",
          "Filing online",
          "Writing it down in a notebook",
          "Sending a text message"
        ],
        "answer": "Filing online",
        "category": "Ways to File Taxes",
        "color": Colors.purple,
        "clicked": false,
      },
      {
        "index": 4,
        "value": 600,
        "question":
            "Which of these is NOT one of the three ways to file taxes?",
        "options": [
          "Online",
          "Paper forms",
          "Through a tax professional",
          "By sending an email to the government"
        ],
        "answer": "By sending an email to the government",
        "category": "Ways to File Taxes",
        "color": Colors.purple,
        "clicked": false,
      },
      {
        "index": 5,
        "value": 900,
        "question":
            "Why do some people get professional help when filing taxes?",
        "options": [
          "To make sure everything is correct and find possible tax benefits",
          "Because they don’t own a computer",
          "To avoid paying taxes",
          "Because only professionals are allowed to file taxes"
        ],
        "answer":
            "To make sure everything is correct and find possible tax benefits",
        "category": "Ways to File Taxes",
        "color": Colors.purple,
        "clicked": false,
      }
    ],
    "Common Tax Mistakes": [
      {
        "index": 6,
        "value": 300,
        "question": "What happens if you miss the tax filing deadline?",
        "options": [
          "Nothing happens",
          "You might have to pay a penalty",
          "You get a bonus refund",
          "The government files your taxes for you"
        ],
        "answer": "You might have to pay a penalty",
        "category": "Common Tax Mistakes",
        "color": Colors.red,
        "clicked": false,
      },
      {
        "index": 7,
        "value": 400,
        "question": "What is one common mistake people make when filing taxes?",
        "options": [
          "Forgetting to write neatly",
          "Entering the wrong personal information",
          "Filing taxes too early",
          "Using a blue pen instead of a black pen"
        ],
        "answer": "Entering the wrong personal information",
        "category": "Common Tax Mistakes",
        "color": Colors.red,
        "clicked": false,
      },
      {
        "index": 8,
        "value": 700,
        "question":
            "What is the risk of making a math mistake on your tax form?",
        "options": [
          "You might end up paying too much or too little tax",
          "Your tax form turns into a quiz",
          "The government will do the math for you automatically",
          "Nothing happens—it’s not important"
        ],
        "answer": "You might end up paying too much or too little tax",
        "category": "Common Tax Mistakes",
        "color": Colors.red,
        "clicked": false,
      }
    ]
  };

  void _showClicked() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🏷️ Title
                Text(
                  "Error",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // 📝 Description
                Text(
                  "Sorry you clicked on this already",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // 🏢 Right Image
                Image.asset(
                  "assets/yellingwawa.png", // Added correct file extension
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                // ✅ Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
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

  void _showPopup(String category, int value, String question,
      List<String> options, String answer) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffeae9ff),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Category: $category',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'For $value points, answer this question:',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/wawaConfused.png',
                  width:
                      (MediaQuery.of(context).size.width * 0.25).clamp(0, 150),
                ),
                const SizedBox(height: 20),
                Column(
                  children: options
                      .map((option) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              width: double
                                  .infinity, // ✅ Fill the whole card width
                              child: ElevatedButton(
                                onPressed: () {
                                  checkAnswer(option, answer, value);
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff2f008d),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void checkAnswer(String selectedOption, String correctAnswer, int value) {
    setState(() {
      _clickCount++;
    });

    if (selectedOption == correctAnswer) {
      setState(() {
        _personValue += value;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct! ✅')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong! ❌')),
      );
      _onWrongAnswer(context);
    }

    // Check if player has reached 600 points
    if (_personValue >= 600) {
      setState(() {
        _continue = true;
      });
    }
    if (_clickCount > 9 && _personValue < 600) {
      if (_clickCount > 9 && _personValue < 600) {
        setState(() {
          // Reset all clicked values to false
          _jeopardy.forEach((category, questions) {
            for (var question in questions) {
              question["clicked"] = false;
            }
          });
        });

        // Navigate back to the previous page
        Navigator.of(context).pop();
      }
    }
  }

  void _onWrongAnswer(BuildContext context) {
    Provider.of<LivesProvider>(context, listen: false).loseLife(context);
    if (Provider.of<ProgressProvider>(context, listen: false).level == 16) {
      Provider.of<ProgressProvider>(context, listen: false)
          .addIncorrectQuestion(context);
    }
    showLifeLossAnimation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff1db),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
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
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 140, 82, 255),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Space between image and text
                          Flexible(
                            child: Text(
                              "Tax Jeopardy",
                              softWrap:
                                  true, // Allows text to wrap to the next line
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32, // Increased font size
                                fontWeight: FontWeight.bold,
                                fontFamily: "Source",
                                height:
                                    1.3, // Adjust line height for better readability
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                const Text(
                  "Get 600 Points to Win",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3, // 3 items per row
                    children: _jeopardy.values
                        .expand((questions) => questions)
                        .map((question) {
                      return GestureDetector(
                        onTap: () {
                          if (question["clicked"] == true) {
                            _showClicked();
                            return;
                          }

                          setState(() {
                            question["clicked"] = true;
                          });

                          _showPopup(
                            question["category"],
                            question["value"],
                            question["question"],
                            List<String>.from(question["options"]),
                            question["answer"],
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: question["color"],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "\$${question["value"]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Overlay for clicked effect
                            if (question["clicked"] == true)
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(
                                      0.3), // Semi-transparent overlay
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                _continue
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 140, 82, 255),
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width *
                                0.1, // Wider padding
                            vertical: MediaQuery.of(context).size.width *
                                0.04, // Taller padding
                          ),
                          minimumSize: Size(
                            MediaQuery.of(context).size.width *
                                0.7, // 70% of screen width
                            MediaQuery.of(context).size.width *
                                0.15, // 15% of screen width
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    : Text(
                        'Your score is $_personValue',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
              ],
            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 10,
                      totalPages: 11,
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
