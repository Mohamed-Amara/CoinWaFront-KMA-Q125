import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  String? _message;

  Future<void> _sendResetLink() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        _message = "Please enter a valid email address!";
      });
      return;
    }

    // Make POST request to the backend to send the reset link
    final response = await http.post(
      Uri.parse('http://localhost:3000/forgot-password'),
      body: {'email': email},
    );

    if (response.statusCode == 200) {
      setState(() {
        _message = "Password reset link sent to your email!";
      });
    } else {
      setState(() {
        _message = "Error sending password reset link.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 202, 255),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 62, 47, 196), // Dark purple
              Color.fromARGB(255, 175, 175, 252), // Lavender
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SourceSans',
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(
                      fontFamily: 'Source', // Font for the input text
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your email', // Set placeholder text
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintStyle: TextStyle(
                        fontFamily: 'Source', // Font for the hint text
                        fontSize: 20,
                        color: Color.fromARGB(255, 120, 112, 222), // Hint text color
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 62, 47, 196), // Dark purple button
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ElevatedButton(
                    onPressed: _sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Ready To Learn!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Source',
                      ),
                    ),
                  ),
                ),
                if (_message != null) ...[
                  SizedBox(height: 20),
                  Text(
                    _message!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontFamily: 'Source', // Font for the error message
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
