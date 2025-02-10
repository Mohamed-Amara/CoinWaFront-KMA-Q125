import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'verification_code_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  String? _message;
  bool _isLoading = false;

  final AuthService _authService = AuthService();

  Future<void> _sendResetLink() async {
    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Empty Email!'),
            content: const Text('Please enter your email address.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
      return;
    }

    try {
      await _authService.forgotPassword(email);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationCodePage(email: email),
        ),
      );
    } catch (e) {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid Email!'),
            content: const Text('Please enter a valid email address.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 202, 255),
      body: Container(
        decoration: const BoxDecoration(
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
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _emailController,
                    style: const TextStyle(
                      fontFamily: 'Source',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintStyle: const TextStyle(
                        fontFamily: 'Source',
                        fontSize: 20,
                        color: Color.fromARGB(255, 120, 112, 222),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 62, 47, 196),
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
                        'Send Reset Link',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Source',
                        ),
                      ),
                    ),
                  ),
                if (_message != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    _message!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontFamily: 'Source',
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
