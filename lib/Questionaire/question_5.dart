import 'package:flutter/material.dart';
import 'package:flutter_application_1/lobby.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:provider/provider.dart';

class Question5Page extends StatefulWidget {
  @override
  _Question5PageState createState() => _Question5PageState();
}

class _Question5PageState extends State<Question5Page> {
  List<String> selectedValues = [];

  void _navigateToLobbyPage(BuildContext context) {
    if (selectedValues.isNotEmpty) {
      Provider.of<ProfileProvider>(context, listen: false)
          .updateUserBadge(context, "welcome");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LobbyPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one option before submitting.')),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0), // Reduced top padding
          child: Column(
            children: [
              // Question Title
              Padding(
                padding: const EdgeInsets.only(top: 40.0), // Less padding
                child: Text(
                  'What’s your financial goal right now?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 15),

              // GridView with Options
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  children: [
                    OptionCard(value: 'option1', label: 'Learning how to manage money better', color: Colors.blue[200]!),
                    OptionCard(value: 'option2', label: 'Saving up for something big', color: Colors.purple[200]!),
                    OptionCard(value: 'option3', label: 'Making my money work for me (investing, earning more)', color: Colors.teal[200]!),
                    OptionCard(value: 'option4', label: 'Building financial independence early', color: Colors.pink[200]!),
                  ].map((card) => GestureDetector(
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
                  )).toList(),
                ),
              ),

              SizedBox(height: 15),

              // Image (Fixed Size & Centered)
              Image.asset(
                "assets/pigdollarsave.png",
                height: MediaQuery.of(context).size.height * 0.25, // Adjusted height
                fit: BoxFit.contain,
              ),

              SizedBox(height: 20),

              // Submit Button (Only if an option is selected)
              if (selectedValues.isNotEmpty)
                ElevatedButton(
                  onPressed: () => _navigateToLobbyPage(context),
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
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Reduced padding
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
