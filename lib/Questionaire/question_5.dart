import 'package:flutter/material.dart';
import 'answer_model.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/lobby.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';

class Question5Page extends StatefulWidget {
  final AnswerModel answerModel;

  Question5Page({Key? key, required this.answerModel}) : super(key: key);

  @override
  _Question5PageState createState() => _Question5PageState();
}

class _Question5PageState extends State<Question5Page> {
  String? selectedValue;
  final AuthService authService = AuthService();

  void _submitAnswers(BuildContext context) async {
    if (selectedValue != null) {
      widget.answerModel.question5Answer = selectedValue;
      print("Current answerModel: ${widget.answerModel.toJson()}");

      bool success =
          await authService.submitAnswers(context, widget.answerModel);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Answers submitted successfully!')),
        );
        Provider.of<ProfileProvider>(context, listen: false)
            .updateUserBadge(context, "welcome");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LobbyPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to submit answers. Please try again later.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an option before submitting.')),
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
          "Question 5",
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
                      'What’s your financial goal right now?',
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
                          onTap: () => setState(() => selectedValue = 'money'),
                          child: OptionCard(
                            value: 'money',
                            label: 'Learning how to manage money better',
                            color: Color(0xFFE4D6F7),
                            isSelected: selectedValue == 'money',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'saving'),
                          child: OptionCard(
                            value: 'saving',
                            label: 'Saving up for something big',
                            color: Color(0xFFDEC6FF),
                            isSelected: selectedValue == 'saving',
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => selectedValue = 'investing'),
                          child: OptionCard(
                            value: 'investing',
                            label:
                                'Making my money work for me (investing, earning more)',
                            color: Color(0xFFCBA5FF),
                            isSelected: selectedValue == 'investing',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(
                              () => selectedValue = 'financial-independence'),
                          child: OptionCard(
                            value: 'financial-independence',
                            label: 'Building financial independence early',
                            color: Color(0xFFC59AFF),
                            isSelected:
                                selectedValue == 'financial-independence',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Image.asset(
                      "assets/pigdollarsave.png",
                      height: screenHeight * 0.2,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    if (selectedValue != null)
                      ElevatedButton(
                        onPressed: () => _submitAnswers(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize:
                              Size(screenWidth * 0.8, screenHeight * 0.06),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text('Submit',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double size = screenWidth < 400
        ? screenWidth * 0.42
        : screenWidth * 0.4; // Adjust for smaller screens

    return Container(
      width: size,
      constraints: BoxConstraints(minHeight: 100), // Ensures a minimum height
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.white,
          width: isSelected ? 3 : 0.5,
        )
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize:
                screenWidth < 400 ? 14 : 18, // Adjust font size dynamically
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          softWrap: true, // Ensures text wraps instead of overflowing
        ),
      ),
    );
  }
}
