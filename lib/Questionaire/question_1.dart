import 'package:flutter/material.dart';
import 'package:flutter_application_1/Questionaire/question_2.dart';
import 'answer_model.dart';

class Question1Page extends StatefulWidget {
  final AnswerModel answerModel;

  const Question1Page({super.key, required this.answerModel});

  @override
  // ignore: library_private_types_in_public_api
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

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
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
              const SizedBox(height: 40), // Adjusted for top padding
              const Text(
                "Question 1",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'How comfortable are you with managing money?',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
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
                          onTap: () =>
                              setState(() => selectedValue = 'beginner'),
                          child: OptionCard(
                            value: 'beginner',
                            label:
                                'I have no experience and want to learn from scratch',
                            color: const Color.fromARGB(
                                255, 140, 82, 255), // #CDE5FF
                            isSelected: selectedValue == 'beginner',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'medium'),
                          child: OptionCard(
                            value: 'medium',
                            label:
                                'I know a little but want to improve my skills',
                            color: const Color.fromARGB(
                                255, 140, 82, 255), // #F1C3FF
                            isSelected: selectedValue == 'medium',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => selectedValue = 'expert'),
                          child: OptionCard(
                            value: 'expert',
                            label:
                                'I feel confident but want to learn advanced strategies',
                            color: const Color.fromARGB(
                                255, 140, 82, 255), // #C3FFFD
                            isSelected: selectedValue == 'expert',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/wawaTalk.png",
                      width: screenWidth * 0.5,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              if (selectedValue != null)
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => _navigateToQuestion2(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Next',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
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

  const OptionCard({
    super.key,
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: Colors.purpleAccent, width: 3)
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Removed Icon, keeping only text
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold), // Increased font size
            textAlign: TextAlign.center, // Center aligned the text
          ),
        ],
      ),
    );
  }
}
