import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:provider/provider.dart';
import '../Backend-Service/auth_service.dart';
import '../lobby.dart';
import 'Forgot-password.dart'; // Import the ForgotPasswordPage
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

Widget _weeklyStreakIndicator(List<bool> streakDays) {
  List<String> weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  if (kDebugMode) {
    print("streakDays received: $streakDays");
  }
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
                "assets/weekstreakback.png"), // Change to your image path
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15), // Keeps rounded edges
          border: Border.all(
              color: const Color.fromARGB(255, 140, 83, 255), width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weekly Streak",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                bool isActive =
                    streakDays.length > index ? streakDays[index] : false;
                return Column(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 30,
                      color: isActive
                          ? const Color.fromARGB(255, 140, 83, 255)
                          : const Color.fromARGB(255, 167, 152, 196),
                    ),
                    const SizedBox(height: 5),
                    Text(weekDays[index], style: const TextStyle(fontSize: 12)),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget getStreakMessage(int streak) {
  if (streak > 0) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            "Amazing! Keep up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 50, 48, 62),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            "your Streak!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 50, 48, 62),
            ),
          ),
        ),
      ],
    );
  } else {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            "Oh no! Log in Tomorrow",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 50, 48, 62),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            "to Unlock a Streak!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 50, 48, 62),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  // Method to handle login
  void _login() async {
    final email = _emailController.text.trim().toLowerCase();
    try {
      final response = await _authService.login(
        email,
        _passwordController.text,
      );
      if (kDebugMode) {
        print('Login successful: $response');
      }

      // Update streak and check for early bird badge
      TimeOfDay now = TimeOfDay.now();
      // ignore: use_build_context_synchronously
      await _authService.updateStreak(context);
      // ignore: use_build_context_synchronously
      if (!(Provider.of<ProfileProvider>(context, listen: false)
              .badges
              .contains("assets/Badges/early.png")) &&
          now.hour == 6) {
        // ignore: use_build_context_synchronously
        Provider.of<ProfileProvider>(context, listen: false)
            // ignore: use_build_context_synchronously
            .updateUserBadge(context, "early");
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? lastDay = prefs.getInt('lastDay');
      int today = DateTime.now().day;
      if (lastDay == null || lastDay != today) {
        if (kDebugMode) {
          print("worked");
        }
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                backgroundColor: const Color(0x00000000),
                contentPadding: EdgeInsets.zero,
                content: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 400,
                        height: 525,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff8483e4),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/streakpopback.png"), // Change to your image path
                            fit: BoxFit.fitWidth,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff8483e4),
                              blurRadius: 0,
                              offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              // Access ProfileProvider using Provider.of(context)
                              Consumer<ProfileProvider>(
                                builder: (context, profileProvider, child) {
                                  // Determine the image based on the streak value
                                  String imageAsset = profileProvider.streak >=
                                          30
                                      ? 'assets/very_fire_wawa.png' // 1 month streak
                                      : profileProvider.streak >= 7
                                          ? 'assets/fire_wawa.png' // 1 week streak
                                          : profileProvider.streak >= 5
                                              ? 'assets/slight_fire_wawa.png' // 5 day streak
                                              : profileProvider.streak >= 3
                                                  ? 'assets/wawa.png' // 3 day streak
                                                  : profileProvider.streak >= 1
                                                      ? 'assets/ice_wawa.png' // 1 day streak
                                                      : 'assets/ice_wawa.png'; // Default for no streak
                                  return Column(
                                    children: [
                                      getStreakMessage(profileProvider.streak),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                0, 0, 0, 0),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Image.asset(
                                          imageAsset,
                                          width: 200,
                                        ),
                                      ),
                                      _weeklyStreakIndicator(
                                          profileProvider.streakDays),
                                      Container(
                                        padding: EdgeInsets
                                            .zero, // Remove padding to avoid misalignment
                                        width: 175,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                45, 72, 51, 166),
                                            width: 1,
                                          ),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromARGB(
                                                    255, 140, 82, 255),
                                                Color.fromARGB(
                                                    255, 81, 51, 211),
                                              ]), // Background color
                                          borderRadius: BorderRadius.circular(
                                              30), // Rounded edges
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(255, 73, 51,
                                                  166), // Shadow color
                                              offset: Offset(
                                                  2, 4), // Shadow position
                                              blurRadius: 0, // No blur
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          // Ensures button content is centered
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(100,
                                                  50), // Adjusted height for better centering
                                              backgroundColor: Colors
                                                  .transparent, // Transparent to show background
                                              shadowColor: Colors
                                                  .transparent, // Remove default shadow
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: const Center(
                                              // Ensures text is centered
                                              child: Text(
                                                "Continue",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
        prefs.setInt('lastDay', today);
      }

      // Navigate to the lobby page
      Navigator.push(
        // ignore: use_build_context_synchronously
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
              MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                  const SizedBox(height: 150),
                  const Text(
                    'Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Source',
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/signupwawa.png',
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 20),
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
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20), // Adjust the margin as needed
                    child: TextButton(
                      onPressed: _login, // Call _forgotPassword to navigate
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF5D2F8E), // Dark purple color
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration:
                              TextDecoration.underline, // Adds underline
                          decorationColor: Color(
                              0xFF5D2F8E), // (Optional) Change underline color
                          decorationThickness:
                              1.0, // (Optional) Adjust thickness
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    padding:
                        EdgeInsets.zero, // Remove padding to avoid misalignment
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(45, 72, 51, 166),
                        width: 1,
                      ),
                      color: const Color.fromARGB(255, 94, 24, 235),
                      borderRadius: BorderRadius.circular(30), // Rounded edges
                      boxShadow: const [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 88, 53, 158), // Shadow color
                          offset: Offset(0, 8), // Shadow position
                          blurRadius: 0, // No blur
                        ),
                      ],
                    ),
                    child: Center(
                      // Ensures button content is centered
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(
                              100, 50), // Adjusted height for better centering
                          backgroundColor: Colors
                              .transparent, // Transparent to show background
                          shadowColor:
                              Colors.transparent, // Remove default shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Center(
                          // Ensures text is centered
                          child: Text(
                            "Ready to Learn!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source',
                            ),
                          ),
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
