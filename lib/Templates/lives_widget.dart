import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Providers/lives_provider.dart';

class LivesWidget extends StatefulWidget {
  final int lives;

  const LivesWidget({Key? key, required this.lives}) : super(key: key);

  @override
  _LivesWidgetState createState() => _LivesWidgetState();
}

class _LivesWidgetState extends State<LivesWidget> {
  bool _isContainerVisible = false;

  void _toggleContainerVisibility() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> lifeImages = [
      'assets/grave.png',
      'assets/red_wa.png',
      'assets/orange_wa.png',
      'assets/yellow_wa.png',
      'assets/green_wa.png',
    ];

    return Consumer<LivesProvider>(
      builder: (context, livesProvider, child) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (_isContainerVisible)
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffB8B8B8),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            GestureDetector(
              onTap: () {
                _toggleContainerVisibility();
              },
              child: Image.asset(
                lifeImages[livesProvider.lives.clamp(0, lifeImages.length - 1)],
                width: 40,
                height: 40,
              ),
            ),
            if (_isContainerVisible)
              Positioned(
                bottom:
                    40, // Adjust this value to position the container higher
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffD5D2FA),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Opacity(
                              opacity: livesProvider.lives > index ? 1.0 : 0.4,
                              child: Image.asset(
                                lifeImages[
                                    index + 1], // Adjust index to match image list
                                width: 40,
                                height: 40,
                              ),
                            ),
                          );
                        }),
                      ),
                      (livesProvider.lives < 4)
                          ? Text(
                              (livesProvider.timeLeft.inSeconds + 30).toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 73, 72, 72),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
