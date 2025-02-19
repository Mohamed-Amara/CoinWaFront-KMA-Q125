import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'reset_password_page.dart';


class VerificationCodePage extends StatefulWidget {
  final String email;

  const VerificationCodePage({super.key, required this.email});

  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final TextEditingController _codeController = TextEditingController();
  String? _message;
  bool _isLoading = false;

  final AuthService _authService = AuthService();

  Future<void> _verifyCode() async {
    setState(() {
      _isLoading = true;
    });

    final code = _codeController.text.trim();

    if (code.isEmpty || code.length < 6) {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Verification Error!'),
            content: const Text('Verification Codes do not Match.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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
      await _authService.verifyResetCode(widget.email, code);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResetPasswordPage(email: widget.email, code: code),
        ),
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
      extendBodyBehindAppBar: true, // Allows content behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.transparent, // Make background transparent to show the image
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Im_Not_New.png'), // Set your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter Verification Code',
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
                  width: 350,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    cursorColor: Colors.black,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: 50,
                      fieldWidth: 55, // Keep spacing
                      borderWidth: 0.8, // Make it thinner
                      inactiveColor: Color.fromARGB(255, 85, 54, 175), // Lighter gray for a softer look
                      activeColor: Color.fromARGB(255, 85, 54, 175),
                      selectedColor: Color.fromARGB(255, 85, 54, 175),
                      inactiveFillColor: Colors.white, // Slightly transparent white
                      activeFillColor:Colors.white,
                      selectedFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    controller: _codeController,
                    keyboardType: TextInputType.number,
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
                      color: Color.fromARGB(255, 62, 47, 196),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ElevatedButton(
                      onPressed: _verifyCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text(
                        'Verify Code',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Source',
                          fontWeight: FontWeight.bold,
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
                      fontFamily: 'SourceSans',
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
