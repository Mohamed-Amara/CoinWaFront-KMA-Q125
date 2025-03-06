// question2.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Questionaire/question_3.dart';
import 'answer_model.dart';

class Question2Page extends StatefulWidget {
  final AnswerModel answerModel;

  Question2Page({Key? key, required this.answerModel}) : super(key: key);

  @override
  _Question2PageState createState() => _Question2PageState();
}

class _Question2PageState extends State<Question2Page> {
  List<String> selectedValues = [];

  void _navigateToQuestion3(BuildContext context) {
    if (selectedValues.isNotEmpty) {
      widget.answerModel.question2Answers = selectedValues;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Question3Page(answerModel: widget.answerModel),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Please select at least one option before submitting.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        title: Text(
          "Question 2",
          style: TextStyle(
            color: Colors.black, // Set the text color to match the arrow color
            fontSize: 15,
          ),
        ),
        centerTitle:
            false, // Ensures the title is left-aligned next to the back arrow
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcome_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60.0), // Adjusted padding to bring the title lower
                  child: Text(
                    'What financial topics interest you the most? (Select all that apply)',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    children: [
                      OptionCard(
                          value: 'Budget',
                          label: 'Budgeting & saving',
                          color: Colors.blue[200]!),
                      OptionCard(
                          value: 'invest',
                          label: 'Earning & investing',
                          color: Colors.purple[200]!),
                      OptionCard(
                          value: 'Credit Card',
                          label: 'Credit cards & loans',
                          color: Colors.teal[200]!),
                      OptionCard(
                          value: 'Spending',
                          label: 'Smart spending & shopping hacks',
                          color: Colors.pink[200]!),
                    ]
                        .map((card) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedValues.contains(card.value)) {
                                    selectedValues.remove(card.value);
                                  } else {
                                    selectedValues.add(card.value);
                                  }
                                });
                              },
                              child: OptionCard(
                                value: card.value,
                                label: card.label,
                                color: card.color,
                                isSelected: selectedValues.contains(card.value),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/pigdollarsave.png"),
                ),
                if (selectedValues.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () => _navigateToQuestion3(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Continue',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String value;
  final String label;
  final bool isSelected;
  final Color color;

  OptionCard({
    required this.value,
    required this.label,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double getFontSize() {
      double baseSize = 16; // Default font size
      double scaleFactor = (screenWidth + screenHeight) /
          1000; // Adjust based on total screen size
      return baseSize *
          scaleFactor.clamp(
              0.8, 1.5); // Keep font size within a reasonable range
    }

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              // fontSize: getFontSize(), // Apply dynamic font size
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
