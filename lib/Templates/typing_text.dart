import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? softWrap;
  final Duration animationSpeed;

  const TypingText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.softWrap,
    this.animationSpeed = const Duration(milliseconds: 1500),
  });


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
      duration: widget.animationSpeed,
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
          style: widget.style ?? const TextStyle(fontSize: 18, fontFamily: 'Source', color: Colors.white),
          textAlign: widget.textAlign,
          softWrap: widget.softWrap,
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
