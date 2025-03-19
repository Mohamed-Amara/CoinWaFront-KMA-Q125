import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:flutter_application_1/Unit4/Coin19/summary.dart';

class TaxJeopardy extends StatefulWidget {
  const TaxJeopardy({super.key});

  @override
  _TaxJeopardyState createState() => _TaxJeopardyState();
}

class _TaxJeopardyState extends State<TaxJeopardy>{
  bool _continue = false;
  int _personValue =0;
  int _clickCount = 0;
  // add colours and clicked function
  Map<String, List<Map<String, dynamic>>> _jeopardy = {
    "Science": [
      {
        "index": 0,
        "value": 100,
        "question": "What is the chemical symbol for water?",
        "options": ["H2O", "CO2", "O2", "NaCl"],
        "answer": "H2O",
        "category": "Science",
        "color": Colors.pink,
        "clicked": false,
      },
      {
        "index": 1,
        "value": 200,
        "question": "What planet is known as the Red Planet?",
        "options": ["Earth", "Mars", "Jupiter", "Venus"],
        "answer": "Mars",
        "category": "Science",
        "color": Colors.pink,
        "clicked": false,
      },
      {
        "index": 2,
        "value": 300,
        "question": "What gas do plants absorb from the atmosphere?",
        "options": ["Oxygen", "Nitrogen", "Carbon Dioxide", "Helium"],
        "answer": "Carbon Dioxide",
        "category": "Science",
        "color": Colors.pink,
        "clicked": false,
      }
    ],
    "History": [
      {
        "index": 3,
        "value": 100,
        "question": "Who was the first president of the United States?",
        "options": ["Abraham Lincoln", "George Washington", "Thomas Jefferson", "John Adams"],
        "answer": "George Washington",
        "category": "History",
        "color": Colors.purple,
        "clicked": false,
      },
      {
        "index": 4,
        "value": 200,
        "question": "In what year did World War II end?",
        "options": ["1941", "1943", "1945", "1950"],
        "answer": "1945",
        "category": "History",
        "color": Colors.purple,
        "clicked": false,
      },
      {
        "index": 5,
        "value": 300,
        "question": "Which ancient civilization built the pyramids?",
        "options": ["Romans", "Greeks", "Egyptians", "Mayans"],
        "answer": "Egyptians",
        "category": "History",
        "color": Colors.purple,
        "clicked": false,
      }
    ],
    "Geography": [
      {
        "index": 6,
        "value": 100,
        "question": "What is the capital city of France?",
        "options": ["Paris", "London", "Berlin", "Rome"],
        "answer": "Paris",
        "category": "Geography",
        "color": Colors.blue,
        "clicked": false,
      },
      {
        "index": 7,
        "value": 200,
        "question": "Which continent is the largest by land area?",
        "options": ["Asia", "Africa", "North America", "Antarctica"],
        "answer": "Asia",
        "category": "Geography",
        "color": Colors.blue,
        "clicked": false,
      },
      {
        "index": 8,
        "value": 300,
        "question": "What is the longest river in the world?",
        "options": ["Amazon", "Nile", "Yangtze", "Mississippi"],
        "answer": "Nile",
        "category": "Geography",
        "color": Colors.blue,
        "clicked": false,
      }
    ]
  };
  void _showClicked(){
    showDialog(
      context: context,
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



  void _showPopup(String category, int value, String question, List<String> options, String answer) {
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
                  width: (MediaQuery.of(context).size.width * 0.25).clamp(0, 150),
                ),
                const SizedBox(height: 20),
                Column(
                  children: options.map((option) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: double.infinity, // ✅ Fill the whole card width
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
                          padding: const EdgeInsets.symmetric(vertical: 14),
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
                  )).toList(),
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
      print('Correct! +$value points');
    } else {
      print('Wrong answer!');
    }

    // Check if player has reached 600 points
    if (_personValue >= 600) {
      setState(() {
        _continue = true;
      });
      print('Congratulations! You reached 600 points.');
    }
    if(_clickCount>9&& _personValue<600){
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



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xfffff1db),
    body: SafeArea(
    child:Stack(
      children:[
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
                      // Image beside the text
                      Image.asset(
                        'assets/controller.png',
                        width: 90, // Increased size for better balance
                      ),
                      const SizedBox(width: 10), // Space between image and text
                      Flexible(
                        child: Text(
                          "Tax Jeopardy",
                          softWrap: true, // Allows text to wrap to the next line
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32, // Increased font size
                            fontWeight: FontWeight.bold,
                            fontFamily: "Source",
                            height: 1.3, // Adjust line height for better readability
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
                children: _jeopardy.values.expand((questions) => questions).map((question) {
                  return GestureDetector(
                    onTap: () {
                      if (question["clicked"] == true){
                        _showClicked();
                        return;
                      }
                         // Prevent clicking again

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

                    child: Container(
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
                  );
                }).toList(),
              ),
            ),
            _continue?ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SummaryPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 140, 82, 255),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1, // Wider padding
                  vertical: MediaQuery.of(context).size.width * 0.04, // Taller padding
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                  MediaQuery.of(context).size.width * 0.15, // 15% of screen width
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
            ):Text(
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