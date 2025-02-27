import 'package:flutter/material.dart';
import 'answer_model.dart';  // Ensure this is correctly defined and imported
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
  // Use a single value for the selected answer
  String? selectedValue;

  // Create an instance of the AuthService
  final AuthService authService = AuthService();

  // Function to handle the submission of answers
  void _submitAnswers(BuildContext context) async {
    if (selectedValue != null) {
      // Map the selected option to an AnswerModel
      widget.answerModel.question5Answer = selectedValue;
      print("Current answerModel: ${widget.answerModel.toJson()}");

      // Submit the answers to the server
      bool success = await authService.submitAnswers(context,widget.answerModel);// this line has error

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Answers submitted successfully!')),
        );
        Provider.of<ProfileProvider>(context, listen: false)
            .updateUserBadge(context, "welcome");

        // Navigate to the next page (for example, LobbyPage)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LobbyPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit answers. Please try again later.')),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcome_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'What’s your financial goal right now?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 15),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  children: [
                    OptionCard(value: 'money', label: 'Learning how to manage money better', color: Colors.blue[200]!),
                    OptionCard(value: 'saving', label: 'Saving up for something big', color: Colors.purple[200]!),
                    OptionCard(value: 'investing', label: 'Making my money work for me (investing, earning more)', color: Colors.teal[200]!),
                    OptionCard(value: 'financial-idependence', label: 'Building financial independence early', color: Colors.pink[200]!),
                  ].map((card) => GestureDetector(
                    onTap: () {
                      setState(() {
                        // Set the selected value to the one tapped
                        selectedValue = card.value;
                      });
                    },
                    child: OptionCard(
                      value: card.value,
                      label: card.label,
                      color: card.color,
                      isSelected: selectedValue == card.value, // Highlight the selected option
                    ),
                  )).toList(),
                ),
              ),

              SizedBox(height: 15),

              Image.asset(
                "assets/pigdollarsave.png",
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.contain,
              ),

              SizedBox(height: 20),

              // Show submit button if a value is selected
              if (selectedValue != null)
                ElevatedButton(
                  onPressed: () => _submitAnswers(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Submit', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Option Card Widget
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
