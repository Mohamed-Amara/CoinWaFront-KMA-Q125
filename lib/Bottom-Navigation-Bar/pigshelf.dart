import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PigShelf());
}

class PigShelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: BookshelfPage(),
        bottomNavigationBar: const BottomBar(initialIndex: 1),
      ),
    );
  }
}

class BookshelfPage extends StatefulWidget {
  @override
  _BookshelfPageState createState() => _BookshelfPageState();
}

class _BookshelfPageState extends State<BookshelfPage> {
  // List to track pig unlock status
  List<bool> pigStatus = List.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 60),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Your Piggy Bank Collection:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Source',
              fontSize: 28,
              color: Color(0xFF7870DE),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 390,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  color: Colors.brown,
                ),
              ),
              SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: const Color(0xffad7045),
                    width: 300,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildShelfRow(context, 0),
                        buildShelfRow(context, 3),
                        buildShelfRow(context, 6),
                        buildShelfBase(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildShelfRow(BuildContext context, int startIndex) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: Container(
            color: const Color(0xff915831),
            width: 280,
            height: 100,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) {
            int pigIndex = startIndex + index;
            Color pigColor = Colors.grey; // Default color

            int completedLevels = Provider.of<ProgressProvider>(context, listen: false).level;
            if (pigIndex == 0 && completedLevels > 5) {
              pigColor = Colors.green; // Turn the first piggy bank green
            } else if (pigIndex == 1 && completedLevels > 10) {
              pigColor = const Color(0xff6327DB); // Turn the second piggy bank purple
            }

            return ColorFiltered(
              colorFilter: ColorFilter.mode(pigColor, BlendMode.srcIn),
              child: Image.asset(
                'assets/smallpiggrey.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget buildShelfBase(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              color: const Color(0xffa06740),
              width: 135,
              height: 135,
            ),
            Positioned(
              right: 10,
              top: 52,
              child: Container(
                color: const Color(0xff915831),
                width: 5,
                height: 30,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Stack(
          children: [
            Container(
              color: const Color(0xffa06740),
              width: 135,
              height: 135,
            ),
            Positioned(
              left: 10,
              top: 52,
              child: Container(
                color: const Color(0xff915831),
                width: 5,
                height: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
