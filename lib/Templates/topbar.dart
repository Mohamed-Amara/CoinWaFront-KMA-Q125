import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/lives_provider.dart';

class TopBar extends StatefulWidget {
  final int currentPage;
  final int totalPages;

  const TopBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool isExpanded = false;
  double boxWidth = 50;

  @override
  Widget build(BuildContext context) {
    List<String> lifeImages = [
      'assets/red_wa.png',
      'assets/orange_wa.png',
      'assets/yellow_wa.png',
      'assets/green_wa.png',
    ];

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isExpanded) {
              boxWidth = 50; // Collapse width
              isExpanded = false;
            } else {
              boxWidth = 280; // Expand width
              isExpanded = true;
            }
          });

          // Delay the visibility change of images
          Future.delayed(const Duration(milliseconds: 250), () {
            setState(() {}); // Update state to reflect visibility change
          });
        },
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: AnimatedContainer(
                width: boxWidth,
                duration: const Duration(milliseconds: 500), // Animation duration
                curve: Curves.easeInOut, // Optional animation curve
                decoration: const BoxDecoration(
                  color: Color(0xff5E17EB),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
                        child: Consumer<LivesProvider>(
                          builder: (context, livesProvider, child) {
                            return Opacity(
                              opacity: livesProvider.lives > index ? 1.0 : 0.3,
                              child: Image.asset(
                                lifeImages[index], // Adjust index to match image list
                                width: 40,
                                height: 40,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Color(0xff7870DE),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '${widget.currentPage}/${widget.totalPages}',
                style: const TextStyle(
                  fontFamily: 'Source',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
