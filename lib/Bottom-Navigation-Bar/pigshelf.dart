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
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/trophy_background.png'), // Add your image here
          fit: BoxFit.cover, // Ensure the image covers the whole screen
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width, // Get screen width dynamically
                  height: 150, // Increased height for a longer banner
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 141, 51, 230), // rgb(118, 121, 185)
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width, // Get screen width dynamically
                height: 150, // Increased height for the banner to match the first container
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 203, 82, 255), // rgb(160, 161, 251)
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30), // Increased space before the text
                    Text(
                      "Your Piggy Bank Collection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source",
                      ),
                    ),
                    SizedBox(height: 20), // Extra space between the text and the bottom
                  ],
                ),
              ),
            ],
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
                    color: Color.fromARGB(255, 203, 82, 255),
                  ),
                ),
                SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: const Color(0xFFF9AE45),
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
      ),
    );
  }


  Widget buildShelfRow(BuildContext context, int startIndex) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: Container(
            color: const Color.fromARGB(255, 107, 108, 126),
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
              print(pigIndex);
              print(completedLevels);
              pigColor = Color(0xFF3CB371); // Turn the first piggy bank green
            } else if (pigIndex == 1 && completedLevels > 10) {
              print(pigIndex);
              print(completedLevels);
              pigColor = const Color(0xFFFFD64B); // Turn the second piggy bank purple
            }else if (pigIndex == 2 && completedLevels >= 15) {
              print(pigIndex);
              print(completedLevels);
              pigColor = const Color(0xFF8BE1D9); // Turn the third piggy bank blue
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
              color: const Color.fromARGB(255, 107, 108, 126),
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
              color: const Color.fromARGB(255, 107, 108, 126),
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
