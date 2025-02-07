import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  int step = 1; // Tracks the current step in the password reset process
  String email = "";
  String code = "";

  final AuthService _authService = AuthService();

  // // Step 1: Request password reset by sending an email
  // Future<void> requestReset() async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:3000/api/password/forgot-password'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'email': emailController.text}),
  //   );
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       email = emailController.text;
  //       step = 2;
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${response.body}')));
  //   }
  // }

  // // Step 2: Verify the reset code
  // Future<void> verifyCode() async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:3000/api/password/verify-code'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'email': email, 'code': codeController.text}),
  //   );
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       code = codeController.text;
  //       step = 3;
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid code')));
  //   }
  // }

  // // Step 3: Reset the password
  // Future<void> resetPassword() async {
  //   if (newPasswordController.text != confirmPasswordController.text) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match')));
  //     return;
  //   }
  //   final response = await http.post(
  //     Uri.parse('http://localhost:3000/api/password/reset-password'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'email': email, 'code': code, 'newPassword': newPasswordController.text}),
  //   );
  //   if (response.statusCode == 200) {
  //     Navigator.pop(context); // Go back to login page
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${response.body}')));
  //   }
  // }


  // Step 1: Request password reset
Future<void> requestReset() async {
  try {
    await _authService.forgotPassword(emailController.text);
    setState(() {
      email = emailController.text;
      step = 2;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}

// Step 2: Verify reset code
Future<void> verifyCode() async {
  try {
    await _authService.verifyResetCode(email, codeController.text);
    setState(() {
      code = codeController.text;
      step = 3;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid code: $e')));
  }
}

// Step 3: Reset password
Future<void> resetPassword() async {
  if (newPasswordController.text != confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match')));
    return;
  }
  try {
    await _authService.resetPassword(email, code, newPasswordController.text);
    Navigator.pop(context); // Go back to login page
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (step == 1) ...[
              TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
              SizedBox(height: 10),
              ElevatedButton(onPressed: requestReset, child: Text("Send Verification Code"))
            ],
            if (step == 2) ...[
              Text("A verification code was sent to $email"),
              TextField(controller: codeController, decoration: InputDecoration(labelText: 'Enter Code')),
              SizedBox(height: 10),
              ElevatedButton(onPressed: verifyCode, child: Text("Verify Code"))
            ],
            if (step == 3) ...[
              TextField(controller: newPasswordController, obscureText: true, decoration: InputDecoration(labelText: 'New Password')),
              TextField(controller: confirmPasswordController, obscureText: true, decoration: InputDecoration(labelText: 'Confirm Password')),
              SizedBox(height: 10),
              ElevatedButton(onPressed: resetPassword, child: Text("Reset Password"))
            ]
          ],
        ),
      ),
    );
  }
}
