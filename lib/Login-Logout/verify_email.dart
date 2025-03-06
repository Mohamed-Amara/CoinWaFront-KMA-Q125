import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import '../Questionaire/question_1.dart';
import 'package:flutter_application_1/Questionaire/answer_model.dart';

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
            content: const Text('Verification Code is invalid or incomplete.'),
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
      // Use the updated method from AuthService
      await _authService.verifyEmail(widget.email, code);

      // Navigate to the next page after successful verification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Question1Page(
              answerModel: AnswerModel()), // Replace with your actual page
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Im_Not_New.png'), // Set your background image here
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
                      fieldWidth: 55,
                      borderWidth: 0.8,
                      inactiveColor: Color.fromARGB(255, 85, 54, 175),
                      activeColor: Color.fromARGB(255, 85, 54, 175),
                      selectedColor: Color.fromARGB(255, 85, 54, 175),
                      inactiveFillColor: Colors.white,
                      activeFillColor: Colors.white,
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
                        onPressed: _verifyCode,
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
                            "Verify Code",
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
