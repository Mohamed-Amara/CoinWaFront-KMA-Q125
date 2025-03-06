import 'package:flutter/material.dart';
import 'package:flutter_application_1/Questionaire/question_4.dart';
import 'answer_model.dart';

class Question3Page extends StatefulWidget {
  final AnswerModel answerModel;

  const Question3Page({super.key, required this.answerModel});

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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Question 3",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      'How do you prefer to track your expenses?',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Wrap(
                      spacing: screenWidth * 0.03,
                      runSpacing: screenHeight * 0.02,
                      alignment: WrapAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'manual'),
                          child: OptionCard(
                            value: 'manual',
                            label: 'I track expenses manually',
                            color: Colors.deepPurple,
                            isSelected: selectedValue == 'manual',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'app'),
                          child: OptionCard(
                            value: 'app',
                            label: 'I use a budgeting app',
                            color: Colors.purple,
                            isSelected: selectedValue == 'app',
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => selectedValue = 'no_tracking'),
                          child: OptionCard(
                            value: 'no_tracking',
                            label: 'I don’t track expenses at all',
                            color: Colors.indigo,
                            isSelected: selectedValue == 'no_tracking',
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      "assets/wawaTalk.png",
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.12,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    if (selectedValue != null)
                      ElevatedButton(
                        onPressed: () => _navigateToQuestion4(context),
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
                            color: Colors.white,
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
