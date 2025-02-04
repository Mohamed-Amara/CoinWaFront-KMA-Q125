import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/ghost.dart';
import 'package:provider/provider.dart';
import '../Providers/lives_provider.dart';

void showLifeLossAnimation(BuildContext context) {
  List<String> lifeImages = [
    'assets/grave.png',
    'assets/red_wa.png',
    'assets/orange_wa.png',
    'assets/yellow_wa.png',
    'assets/green_wa.png',
  ];
  final livesProvider = Provider.of<LivesProvider>(context, listen: false);

  final overlay = Overlay.of(context);

  if (livesProvider.lives > 0) {
    final overlayEntry = OverlayEntry(
      builder: (context) => LifeLossAnimationWidget(
        lifeImage: lifeImages[livesProvider.lives],
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Ghost(),
      ),
    );
  }
}

class LifeLossAnimationWidget extends StatefulWidget {
  final String lifeImage;

  const LifeLossAnimationWidget({
    super.key,
    required this.lifeImage,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LifeLossAnimationWidgetState createState() =>
      _LifeLossAnimationWidgetState();
}

class _LifeLossAnimationWidgetState extends State<LifeLossAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.8, end: -1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * _animation.value,
      left: MediaQuery.of(context).size.width * 0.4,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 130,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '-1',
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 187, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                widget.lifeImage,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
