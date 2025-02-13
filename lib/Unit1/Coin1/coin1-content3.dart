import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-quiz.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Coin1Cont3());
}

class Coin1Cont3 extends StatefulWidget {
  const Coin1Cont3({super.key});

  @override
  _Coin1Cont3State createState() => _Coin1Cont3State();
}

class _Coin1Cont3State extends State<Coin1Cont3> {
  int slideIndex = 0;
  final List<String> slides = [
    "Then, after a few months of saving money...(5/6)",
    "He has enough money to buy a new bike! (6/6)",
  ];

  void _nextSlide() {
    setState(() {
      if (slideIndex < slides.length - 1) {
        slideIndex++;
      } else {
        if (Provider.of<ProgressProvider>(context, listen: false).level == 1) {
          Provider.of<ProgressProvider>(context, listen: false).setSublevel(context, 3);
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Coin1Quiz(isRepeat: false)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 241, 219),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque, // Makes the entire screen tappable
          onTap: _nextSlide,
          child: SafeArea(
            child: Stack(
              children: [
                ExitButton(),
                const Align(
                  alignment: Alignment.topRight,
                  child: TopBar(currentPage: 3, totalPages: 3),
                ),
                Column(
                  children: [
                    const SizedBox(height: 85),
                    Padding(
                      padding: const EdgeInsets.only(left: 56),
                      child: SpeechBubble(text: slides[slideIndex]),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Image.asset('assets/wawaTalk.png', width: 150),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/expaper.png',
                          width: min(MediaQuery.of(context).size.width, 450),
                        ),
                        Image.asset('assets/bike coinwa.png', width: 350),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpeechBubble extends StatelessWidget {
  final String text;
  const SpeechBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 120, 112, 222),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TypingText(text: text),
    );
  }
}

class TypingText extends StatefulWidget {
  final String text;
  const TypingText({super.key, required this.text});

  @override
  _TypingTextState createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(TypingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _controller.reset();
      _animation = IntTween(begin: 0, end: widget.text.length)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        String typedText = widget.text.substring(0, _animation.value);
        return Text(
          typedText,
          style: const TextStyle(fontSize: 18, fontFamily: 'Source', color: Colors.white),
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
