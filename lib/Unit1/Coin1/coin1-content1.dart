import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-content2.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

void main() {
  runApp(const Coin1Cont1());
}

class Coin1Cont1 extends StatelessWidget {
  const Coin1Cont1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ExitButton(),
              const Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TopBar(
                        currentPage: 2,
                        totalPages: 3,
                      ),
                    ),
                  ),
                ],
              ),
               SingleChildScrollView(
                 child: Column(
                  children: [
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment
                            .topLeft, // Align the speech bubble to the top left
                        child: Padding(
                          padding: EdgeInsets.only(
                              left:
                                  56), // Add left padding to move it slightly left
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 85), // Add space at the top
                              SpeechBubble(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Image.asset('assets/wawaTalk.png', width: 150,),
                        ),
                      ],
                    ),
                    Image.asset('assets/expaper.png', width: min(MediaQuery.of(context).size.width, 450)),
                  ],
                             ),
               ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class SpeechBubble extends StatefulWidget {
  const SpeechBubble({super.key});

  @override
  _SpeechBubbleState createState() => _SpeechBubbleState();
}

class _SpeechBubbleState extends State<SpeechBubble> {
  bool tapped = false;
  int tapCount = 0;

  void _toggleTapped() {
    setState(() {
      tapCount++;
      if (tapCount == 2) {
        // Navigate to the next page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin1Cont2()),
        );
      }
      if (tapped) {
        // If already tapped, toggle back to original state
        tapped = false;
      } else {
        // Toggle to the second state
        tapped = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleTapped,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: tapped
              ? const Color.fromARGB(255, 120, 112, 222)
              : const Color.fromARGB(255, 120, 112, 222),
          borderRadius: BorderRadius.circular(20),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: tapped
              ? TypingText(
                  key: UniqueKey(),
                  text: "Let's think of another example... (2/6)",
                  style: const TextStyle(
                      fontSize: 20, fontFamily: 'Source', color: Colors.white),
                )
              : TypingText(
                  key: UniqueKey(),
                  text:
                      "Saving means setting aside money to use later, instead of spending it right away. (1/6)",
                  style: const TextStyle(
                      fontSize: 18, fontFamily: 'Source', color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const TypingText({super.key, required this.text, required this.style});

  @override
  _TypingTextState createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: widget.text.length)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        String typedText = widget.text.substring(0, _animation.value);
        return Text(
          typedText,
          style: widget.style,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
        child: Text('This is the next page.'),
      ),
    );
  }
}
