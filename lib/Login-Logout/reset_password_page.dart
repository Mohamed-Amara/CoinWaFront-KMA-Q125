import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'login2.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String code;

  const ResetPasswordPage({super.key, required this.email, required this.code});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _message;
  bool _isLoading = false;

  final AuthService _authService = AuthService();

  Future<void> _resetPassword() async {
    setState(() {
      _isLoading = true;
    });

    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Empty Password!'),
            content: const Text('Please enter and confrim your password.'),
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
        _isLoading = false;
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Passwords do not Match!'),
            content: const Text('Please try again.'),
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
        _isLoading = false;
      });
      return;
    }

    try {
      await _authService.resetPassword(widget.email, widget.code, password);
      setState(() {
        _message = "Password successfully reset. You can now log in.";
      });

      // Navigate to login2.dart after resetting the password
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const Login2App()), // Replace with your login2.dart class name
      );
    } catch (e) {
      setState(() {
        _message = "Error: $e";
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 62, 47, 196),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                  'Reset Password',
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
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(
                      fontFamily: 'Source',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter new password',
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
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    style: const TextStyle(
                      fontFamily: 'Source',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Confirm new password',
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
                      onPressed: _resetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text(
                        'Reset Password',
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
