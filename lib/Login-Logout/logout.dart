import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'package:flutter_application_1/Login-Logout/home_screen.dart';
import 'package:provider/provider.dart';
import '../Providers/profile_provider.dart'; // Make sure this import path is correct

final AuthService _authService = AuthService();

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      final response = await _authService.logout();
      print('logout successful');

      // Clear user data from ProfileProvider
      Provider.of<ProfileProvider>(context, listen: false).clearUserData();

      // Navigate to the HomeScreen after successful logout
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('logout failed');
      // Optionally, show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout failed, please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: IconButton(
        icon: const Row(
          children: [
            Text(
              'LOG OUT',
              style: TextStyle(
                color: Color.fromARGB(255, 83, 83, 83),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.logout,
              color: Color.fromARGB(255, 83, 83, 83),
              size: 30,
            ),
          ],
        ),
        onPressed: () {
          _logout(context);
        },
      ),
    );
  }
}
