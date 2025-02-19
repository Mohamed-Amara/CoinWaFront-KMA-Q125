import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-WHERE.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/lobby.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(name: '', birthday: ''),
    );
  }
}

class LoginPage extends StatefulWidget {
  final String name;
  final String birthday;
  const LoginPage({super.key, required this.name, required this.birthday});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  String? _errorMessage;

  bool _isValidEmail(String email) {
    // Check email format: _____@_____.____
    RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegExp.hasMatch(email);
  }

  void _register() async {
    String email = _emailController.text.trim();

    if (!_isValidEmail(email)) {
      // Show the error dialog for invalid email format
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Email'),
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
      return; // Don't proceed if email is invalid
    }

    if (_passwordController.text != _rePasswordController.text) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Try Again:'),
          content: const Text('Passwords do not Match!'),
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
      return; // Don't proceed if passwords don't match
    }

    try {
      final response = await _authService.register(
        widget.name,
        widget.birthday,
        _usernameController.text,
        email,
        _passwordController.text,
      );

      // If registration is successful, update user badge and navigate to lobby
      Provider.of<ProfileProvider>(context, listen: false)
          .updateUserBadge(context, "welcome");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LobbyPage()),
      );
    } catch (e) {
      // Handle specific error for username already existing
      if (e.toString().contains("Username already exists")) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Username Taken'),
            content: const Text('Please choose a different username.'),
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
      } else {
        // Handle other errors
        setState(() {
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows background image behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Makes AppBar transparent
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Im_Not_New.png'), // Updated background image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  const Text(
                    'Now, let\'s get you setup!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SourceSans',
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/3dcoin.png',
                    width: 60,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: 85,
                      width: 420,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 241, 219),
                        border: Border.all(
                            color: const Color.fromARGB(255, 94, 24, 235),
                            width: 4.0),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                          fontFamily: 'Source',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'Source',
                            fontSize: 20,
                            color: Color.fromARGB(255, 120, 112, 222),
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: 85,
                      width: 420,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 241, 219),
                        border: Border.all(
                            color: const Color.fromARGB(255, 94, 24, 235),
                            width: 4.0),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(
                          fontFamily: 'Source',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            fontFamily: 'Source',
                            fontSize: 20,
                            color: Color.fromARGB(255, 120, 112, 222),
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: 85,
                      width: 420,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 241, 219),
                        border: Border.all(
                            color: const Color.fromARGB(255, 94, 24, 235),
                            width: 4.0),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                          fontFamily: 'Source',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Source',
                            fontSize: 20,
                            color: Color.fromARGB(255, 120, 112, 222),
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: 85,
                      width: 420,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 241, 219),
                        border: Border.all(
                            color: const Color.fromARGB(255, 94, 24, 235),
                            width: 4.0),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextFormField(
                        controller: _rePasswordController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(
                          fontFamily: 'Source',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Re-write Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Source',
                            fontSize: 20,
                            color: Color.fromARGB(255, 120, 112, 222),
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80.0),
                  SizedBox(
                    height: 60,
                    width: 220,
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromARGB(255, 94, 24, 235),
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
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
