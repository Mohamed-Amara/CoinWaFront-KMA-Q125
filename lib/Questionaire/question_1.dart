import 'package:flutter/material.dart';
import 'package:flutter_application_1/Questionaire/question_2.dart';
import 'answer_model.dart';

class Question1Page extends StatefulWidget {
  final AnswerModel answerModel;

  const Question1Page({super.key, required this.answerModel});

  @override
  _Question1PageState createState() => _Question1PageState();
}

class _Question1PageState extends State<Question1Page> {
  String? selectedValue;

  void _navigateToQuestion2(BuildContext context) {
    if (selectedValue != null) {
      widget.answerModel.question1Answer = selectedValue;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Question2Page(answerModel: widget.answerModel),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: IntrinsicHeight(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/welcome_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.03,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.05),
                        Text(
                          "Question 1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.05,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'How comfortable are you with managing money?',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                    Wrap(
                      spacing: screenWidth * 0.03,
                      runSpacing: screenHeight * 0.02,
                      alignment: WrapAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              setState(() => selectedValue = 'beginner'),
                          child: OptionCard(
                            value: 'beginner',
                            label:
                                'I have no experience and want to learn from scratch',
                            color: Colors.deepPurple,
                            isSelected: selectedValue == 'beginner',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'medium'),
                          child: OptionCard(
                            value: 'medium',
                            label:
                                'I know a little but want to improve my skills',
                            color: Colors.purple,
                            isSelected: selectedValue == 'medium',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'expert'),
                          child: OptionCard(
                            value: 'expert',
                            label:
                                'I feel confident but want to learn advanced strategies',
                            color: Colors.indigo,
                            isSelected: selectedValue == 'expert',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Image.asset(
                      "assets/wawaTalk.png",
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.12,
                      fit: BoxFit.contain,
                    ),
                    if (selectedValue != null)
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: ElevatedButton(
                          onPressed: () => _navigateToQuestion2(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            minimumSize:
                                Size(screenWidth * 0.8, screenHeight * 0.06),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
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

  const OptionCard({
    super.key,
    required this.value,
    required this.label,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide * 0.35;

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.08),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: Colors.purpleAccent, width: 3)
            : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: size * 0.08,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ),
    );
  }
}
