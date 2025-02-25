import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login-Logout/home_screen.dart';
import 'package:provider/provider.dart';
import '../Providers/profile_provider.dart'; // Ensure the path is correct

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      if (kDebugMode) {
        print('Logout successful');
      }

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
      if (kDebugMode) {
        print('Logout failed');
      }

      // Show error message using ScaffoldMessenger
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logout failed, please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // Aligns to the right
      child: Padding(
        padding: const EdgeInsets.only(right: 20), // Adds right margin
        child: TextButton.icon(
          onPressed: () {
            _logout(context);
          },
          icon: const Icon(
            Icons.logout,
            color: Color.fromARGB(255, 35, 0, 61),
            size: 30,
          ),
          label: const Text(
            'LOG OUT',
            style: TextStyle(
              color: Color.fromARGB(255, 35, 0, 61),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
