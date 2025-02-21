// question1.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Questionaire/question_4.dart';
import 'answer_model.dart';

class Question3Page extends StatefulWidget {
  final AnswerModel answerModel;

  Question3Page({Key? key, required this.answerModel}) : super(key: key);

  @override
  _Question3PageState createState() => _Question3PageState();
}

class _Question3PageState extends State<Question3Page> {
  String? selectedValue;

  void _navigateToQuestion4(BuildContext context) {
    if (selectedValue != null) {
      widget.answerModel.question3Answer = selectedValue;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Question4Page(answerModel: widget.answerModel),
        ),
      );
    }
  }


@override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        title: Text(
          "Question 3",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcome_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppBar().preferredSize.height + 40), // Adjusted for lower app bar
              Text(
                'How do you currently manage your money?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'Beginner'),
                          child: OptionCard(
                            value: 'option1',
                            label: "I don’t track my spending at all",
                            color: Colors.blue[200]!,
                            isSelected: selectedValue == 'option1',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'medium'),
                          child: OptionCard(
                            value: 'option2',
                            label: "I try to save but don’t have a system",
                            color: Colors.purple[200]!,
                            isSelected: selectedValue == 'option2',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'expert'),
                          child: OptionCard(
                            value: 'option3',
                            label: "I use an app, budget, or track my finances regularly",
                            color: Colors.teal[200]!,
                            isSelected: selectedValue == 'option3',
                          ),
                        ),
                      ],
                    ),
                    Spacer(), // Pushes the image towards the bottom
                    Image.asset(
                      "assets/wawaBag.png", // Updated image path
                      width: screenWidth * 0.5, // Responsive image size
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              if (selectedValue != null) // Show button only after selection
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => _navigateToQuestion4(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Continue', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
            ],
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
    double size = MediaQuery.of(context).size.width * 0.4; // Square size

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: Colors.blue, width: 3) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
