import 'package:flutter/material.dart';
import 'package:flutter_application_1/Questionaire/question_5.dart';
import 'answer_model.dart';

class Question4Page extends StatefulWidget {
  final AnswerModel answerModel;

  const Question4Page({super.key, required this.answerModel});

  @override
  _Question4PageState createState() => _Question4PageState();
}

class _Question4PageState extends State<Question4Page> {
  String? selectedValue;

  void _navigateToQuestion5(BuildContext context) {
    if (selectedValue != null) {
      widget.answerModel.question4Answer = selectedValue;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Question5Page(answerModel: widget.answerModel),
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
          "Question 4",
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
                      'If you received \$100 right now, what would you do with it?',
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
                          onTap: () =>
                              setState(() => selectedValue = 'spend_all'),
                          child: OptionCard(
                            value: 'spend_all',
                            label: 'Spend it on something I want',
                            color: Colors.blue,
                            isSelected: selectedValue == 'spend_all',
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => selectedValue = 'save_some'),
                          child: OptionCard(
                            value: 'save_some',
                            label: 'Save a portion and spend the rest',
                            color: Colors.pink,
                            isSelected: selectedValue == 'save_some',
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => selectedValue = 'invest_it'),
                          child: OptionCard(
                            value: 'invest_it',
                            label: 'Invest it or use it to grow my money',
                            color: Colors.teal,
                            isSelected: selectedValue == 'invest_it',
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
                        onPressed: () => _navigateToQuestion5(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize:
                              Size(screenWidth * 0.8, screenHeight * 0.06),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text('Continue',
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                color: Colors.white)),
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
