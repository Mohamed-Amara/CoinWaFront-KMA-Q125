import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-Scene1.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-buscard.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stancard.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-stucard.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart'; 

void main() {
  runApp(Coin13shuffle());
}

class Coin13shuffle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slideshow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSlideshowPage(),
    );
  }
}

class ImageSlideshowPage extends StatefulWidget {
  @override
  _ImageSlideshowPageState createState() => _ImageSlideshowPageState();
}

class _ImageSlideshowPageState extends State<ImageSlideshowPage> {
  List<String> images = [
    'assets/stucard.png',
    'assets/buscard.png',
    'assets/creditcardintro.png',
  ];

  int _shuffleKey = 0;

  void shuffleImages() {
    setState(() {
      images.shuffle();
      _shuffleKey = Random().nextInt(1000000); // Update key to trigger animation
    });
  }

  void navigateToImagePage(String image) {
    if (image == 'assets/stucard.png') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Coin13stu(), // Navigate to the first page
        ),
      );
    } else if (image == 'assets/buscard.png') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Coin13bus(), // Navigate to the second page
        ),
      );
    } else if (image == 'assets/creditcardintro.png') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Coin13stan(), // Navigate to the third page
        ),
      );
    }
  }

  void navigateToMagicWawaPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Coin13scene1(isRepeat: false,), // Replace with the actual page you want to navigate to
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      backgroundColor: const Color(0xfffff1db),
      body: Column(
        children: [
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 3,
                      totalPages: 6,
                    ),
                  ),
                ),
              ],
            ),
          SizedBox(height: 0),
          purpleTextBubble('Shuffle The Cards!'),
          SizedBox(height: 50),
          Text(
            'Tap the Card Picked! \n\nThen tap Wawa when \nyou have seen all the types of cards!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 120, 112, 222),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAnimatedImage(images[0], 0.8),
              _buildAnimatedImage(images[1], 1.2),
              _buildAnimatedImage(images[2], 0.8),
            ],
          ),
          SizedBox(height: 40),
          SizedBox(
            height: 50,
            width: 180,
            child: ElevatedButton(
              onPressed: shuffleImages,
              child: Text(
                'Shuffle Images',
                style: TextStyle(fontSize: 18, fontFamily: 'Source'),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 120, 112, 222),
              ),
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: navigateToMagicWawaPage, // Define navigation action on tap
            child: Image.asset(
              'assets/magicwawa.png',
              width: 245,
            ),
          ),
          
        ],
      ),
      
    );
    
  }

  Widget _buildAnimatedImage(String image, double scale) {
    return GestureDetector(
      onTap: () => navigateToImagePage(image),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Transform.scale(
          key: ValueKey<int>(_shuffleKey), // Unique key to trigger switcher
          scale: scale,
          child: Image.asset(
            image,
            width: scale * 100 + 50,
            height: scale * 100 + 50,
          ),
        ),
      ),
    );
  }
}