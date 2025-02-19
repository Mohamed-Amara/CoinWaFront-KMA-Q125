import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:provider/provider.dart';
import '../Backend-Service/auth_service.dart';
import '../lobby.dart';
import 'Forgot-password.dart'; // Import the ForgotPasswordPage
import 'home_screen.dart';

void main() {
  runApp(const Login2App());
}

// Main app widget
class Login2App extends StatelessWidget {
  const Login2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

// Login page widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  // Method to handle login
  void _login() async {
    try {
      final response = await _authService.login(
        _emailController.text,
        _passwordController.text,
      );
      print('Login successful: $response');

      // Update streak and check for early bird badge
      TimeOfDay now = TimeOfDay.now();
      await _authService.updateStreak(context);
      if (!(Provider.of<ProfileProvider>(context, listen: false)
              .badges
              .contains("assets/Badges/early.png")) &&
          now.hour == 6) {
        Provider.of<ProfileProvider>(context, listen: false)
            .updateUserBadge(context, "early");
      }

      // Navigate to the lobby page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LobbyPage()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });

      // Show the error dialog
      _showErrorDialog();
    }
  }

  // Method to show error dialog
  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Username and/or Password is Incorrect!'),
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
  }

  // Navigate to ForgotPasswordPage
  void _forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const ForgotPasswordPage(), // Navigate to ForgotPasswordPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows content behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Makes AppBar transparent
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Im_Not_New.png'), // Updated image
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
                  const SizedBox(height: 80),
                  const Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SourceSans',
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 40),
                    child: Container(
                      height: 85,
                      width: 420,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 241, 219),
                        border: Border.all(
                          color: const Color.fromARGB(255, 94, 24, 235),
                          width: 4.0,
                        ),
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
                    padding: const EdgeInsets.only(left: 0, top: 40),
                    child: Container(
                      height: 85,
                      width: 420,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 241, 219),
                        border: Border.all(
                          color: const Color.fromARGB(255, 94, 24, 235),
                          width: 4.0,
                        ),
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
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  SizedBox(
                    height: 60,
                    width: 220,
                    child: ElevatedButton(
                      onPressed: _login,
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
                  // Forgot password button
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20), // Adjust the margin as needed
                    child: TextButton(
                      onPressed:
                          _forgotPassword, // Call _forgotPassword to navigate
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF5D2F8E), // Dark purple color
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
