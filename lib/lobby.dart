import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin1/coin1-Scene1.dart';
import 'package:flutter_application_1/Unit1/Coin3/coin3-intro.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-WHERE.dart';
import 'package:flutter_application_1/Unit1/Coin5.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Leaderboards/leaderboard2.dart';
import 'package:flutter_application_1/Templates/getstarted-template.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-intro.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin1/coin6-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin2/coin7-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin3/coin8-intro.dart';
import 'package:flutter_application_1/Unit2/Unit2Coin4/coin9-intro.dart';
import 'package:flutter_application_1/Unit3/Coin11/coin11-intro.dart';
import 'package:flutter_application_1/Unit3/Coin12/coin12-intro.dart';
import 'package:flutter_application_1/Unit3/Coin14/coin14-intro.dart';
import 'package:flutter_application_1/Unit3/coin15.dart';
import 'package:flutter_application_1/Unit2/coin10.dart';
import 'package:flutter_application_1/Unit3/Coin13/coin13-limit.dart';
import 'package:flutter_application_1/Templates/ghost.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/pigshelf.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/profile.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:provider/provider.dart';
import 'Providers/lives_provider.dart';
import 'Providers/profile_provider.dart';
import 'Templates/lives_widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class LobbyApp extends StatelessWidget {
  const LobbyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lobby Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LobbyPage(),
    );
  }
}

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  int _selectedIndex = 0;
  int unit = 0;


//This allows the lobby page to fetch the MongoDB database for the user's data
  Future<void> fetchData() async {
    await Future.wait([
      context.read<LivesProvider>().fetchUserData(context),
      context.read<CoinProvider>().fetchUserData(context),
      context.read<ProgressProvider>().fetchUserData(context),
      context.read<ProfileProvider>().fetchUserData(context), // Add this line
    ]);
  }


//This is used for changing the color of the piggy bank and title when you scroll
  final List<Color> _colors = [
     const Color(0xff21945C),
     const Color(0xFF7870DE),
     const Color.fromARGB(255, 61, 121, 231),
  ];

//The coin itself has an imprint that changes based on level. Add more to the list if you want to add more levels 
  final List<String> _coinImage = [
    "assets/wallet_coin.png",
    "assets/coin_level.png"
  ];
  final ScrollController _scrollController = ScrollController(); //Let's you observe scrolling information on the page
  List<String> titles = ["Saving", "Assets/Liabilities", "Credit Cards"]; //Titles of all the units
  Color _titleColor = const Color(0xff21945C);

@override
void initState() {
  super.initState();
  _scrollController.addListener(_scrollListener);

  WidgetsBinding.instance.addPostFrameCallback((_) {
    fetchData();
  });
}


//This is responsible for the title and piggybank colors changing based on how far you scroll
  void _scrollListener() {
    final scrollPosition = _scrollController.position.pixels;
    const changeColorPosition = 550;
    const changeColorPosition2 = 1100;
    if (scrollPosition < changeColorPosition2 && scrollPosition > changeColorPosition &&
        _titleColor != const Color(0xFF7870DE)) {
      setState(() {
        _titleColor = const Color(0xFF7870DE);
        unit = 1;
      });
    } else if (scrollPosition <= changeColorPosition &&
        _titleColor != const Color(0xff21945C)) {
      setState(() {
        _titleColor = const Color(0xff21945C);
        unit = 0;
      });
    }
    else if (scrollPosition >= changeColorPosition2 &&
        _titleColor != const Color.fromARGB(255, 61, 121, 231)){
          setState(() {
        _titleColor = const Color.fromARGB(255, 61, 121, 231);
        unit = 2;
      });
        }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//This is the main build method

  @override
  Widget build(BuildContext context) {
    final double containerWidth = min(MediaQuery.of(context).size.width, 500); //MediaQuery.of(context).size.width basically fetches the width of the screen you are using the app on
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Center(
                child: SizedBox(
                  width: containerWidth,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 130),
                      _buildUnit1(context),
                      _buildHorizontalLine(titles[1]),
                      _buildUnit2(context),
                      _buildHorizontalLine(titles[2]),
                      _buildUnit3(context),
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer( //animated so color can change smoothly
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: _titleColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Piggy Bank ${unit + 1}:',
                    style: const TextStyle(
                      fontFamily: "Serif",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  titles[unit],
                  style: const TextStyle(
                    fontFamily: "Serif",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _colors[unit],
                          BlendMode.modulate,
                        ),
                        child: Image.asset(
                          'assets/Unit 3/white_pig.png', //Basically the piggy bank image is a white color. It masks the color based on which unit you are on.
                          width: containerWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/wacoin.png', // This is the amount of coins the user has
                            width: 40,
                            height: 40,
                          ),
                          Consumer<CoinProvider>(
                            builder: (BuildContext context, coinProvider, child) {
                              return Text(
                                '${coinProvider.coin}', // Uses provider to fetch the database for the amount of coins the user has and displays it
                                style: const TextStyle(
                                  color: Color(0xFFEFEBEB),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 10),
                          Consumer<ProfileProvider>(
                            builder: (context, profileProvider, child) {
                              String imageAsset;

                              // Default to ice_wawa.png if no streak or any other condition is met
                              if (profileProvider.streak >= 30) {
                                imageAsset = 'assets/very_fire_wawa.png'; // 1 month streak
                              } else if (profileProvider.streak >= 7) {
                                imageAsset = 'assets/fire_wawa.png'; // 1 week streak
                              } else if (profileProvider.streak >= 5) {
                                imageAsset = 'assets/slight_fire_wawa.png'; // 5 day streak
                              } else if (profileProvider.streak >= 3) {
                                imageAsset = 'assets/wawa.png'; // 3 day streak
                              } else if (profileProvider.streak >= 1) {
                                imageAsset = 'assets/ice_wawa.png'; // 1 day streak
                              } else {
                                imageAsset = 'assets/ice_wawa.png'; // Default to ice_wawa for no streak
                              }

                              return Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 150.0), // Move image slightly downward
                                        child: Image.asset(
                                          imageAsset,
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 170.0), // Keep text aligned relative to the image
                                        child: Text(
                                          '${profileProvider.streak}',
                                          style: const TextStyle(
                                            color: Color(0xFFEFEBEB),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );


                            },
                          ),

                          const SizedBox(width: 10),
                          Consumer<LivesProvider>(
                            builder: (context, livesProvider, child) {
                              return Row(
                                children: [
                                  LivesWidget(
                                    lives: livesProvider.lives,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${livesProvider.lives}', // Show lives count
                                    style: const TextStyle(
                                      color: Color(0xFFEFEBEB),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 85,
                  child: BottomNavigationBar(
                    backgroundColor: const Color(0xFFEFEBEB),
                    items: <BottomNavigationBarItem>[
                      _buildBottomNavigationBarItem(icon: Icons.home, index: 0),
                      _buildBottomNavigationBarItem(
                          icon: const AssetImage('assets/stacked_pig.png'),
                          index: 1),
                      _buildBottomNavigationBarItem(
                          icon: Icons.emoji_events, index: 2),
                      _buildBottomNavigationBarItem(
                          icon: Icons.person, index: 3),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: const Color(0xFF7870DE),
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    iconSize: 30,
                    onTap: (index) {
                      setState(() { //set state is necessary for real-time updates on the screen (can only use with Stateful widget)
                        _selectedIndex = index;
                      });

                      //The following allows the user to be routed to a different page depending on which button they press on the bottom navigation bar
                      if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LeaderboardWidget()),
                        );
                      }
                      if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );

                      }
                      if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PigShelf()),
                        );

                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {required dynamic icon, required int index}) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 213, 210, 250)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(10),
        child: icon is IconData
            ? Icon(icon, color: const Color(0xFFA39CD6))
            : ImageIcon(icon, color: const Color(0xFFA39CD6)),
      ),
      label: '',
    );
  }


//Widget for creating all the coins for unit 1
  Widget _buildUnit1(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
      child: Column(
        children: <Widget>[
          _buildCoinLevel(context, Alignment.centerLeft, "What is Saving?",
              index: 0, isFirst: true),
          _buildCoinLevel(context, Alignment.centerRight, "Benefits of Saving",
              index: 1),
          _buildCoinLevel(context, Alignment.centerLeft, "Setting Saving Goals",
              index: 2, isFirst: true),
          _buildCoinLevel(
              context, Alignment.centerRight, "Where to Save Your Money",
              index: 3),
          _buildCoinLevel(
              context, Alignment.centerLeft, "Piggy Bank 1 End",
              index: 4, isFirst: true),
        ],
      ),
    );
  }

//This is the horizontal line in between units 
  Widget _buildHorizontalLine(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(
              thickness: 1.5,
              color: Color(0xFF7870DE),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7870DE),
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 1.5,
              color: Color(0xFF7870DE),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnit2(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
      child: Column(
        children: <Widget>[
          _buildCoinLevel(
              context, Alignment.centerLeft, "What Are Assets?",
              index: 5, isFirst: true),
          _buildCoinLevel(context, Alignment.centerRight, "Depreciating/Appreciating Assets",
              index: 6),
          _buildCoinLevel(context, Alignment.centerLeft, "What are Liabilities",
              index: 7, isFirst: true),
          _buildCoinLevel(context, Alignment.centerRight, "Net Worth",
              index: 8),
          _buildCoinLevel(context, Alignment.centerLeft, "Piggy Bank 2 End",
              index: 9, isFirst: true),
        ],
      ),
    );
  }

  Widget _buildUnit3(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
      child: Column(
        children: <Widget>[
          _buildCoinLevel(
              context, Alignment.centerLeft, "Good Debt vs Bad Debt",
              index: 10, isFirst: true),
          _buildCoinLevel(context, Alignment.centerRight, "What is a Credit Card",
              index: 11),
          _buildCoinLevel(context, Alignment.centerLeft, "Types of Credit Cards",
              index: 12, isFirst: true),
          _buildCoinLevel(context, Alignment.centerRight, "How to Get a Credit Card",
              index: 13),
          _buildCoinLevel(context, Alignment.centerLeft, "Piggy Bank 3 End",
              index: 14, isFirst: true),
        ],
      ),
    );
  }

  //These are the intro pages to every coin
  final List<Widget> _pages = [
    const CoinStackTemplate(
      title: "Coin 1: What is Saving?",
      transfer: Scene1(),
      sublevelCount: 3,
      levelNumber: 1,
    ),
    const CoinStackTemplate(
      title: "Coin 2: Why Save Money?",
      transfer: Coin2Intro(),
      sublevelCount: 7,
      levelNumber: 2,
    ),
    const CoinStackTemplate(
      title: "Coin 3: Setting Saving Goals",
      transfer: Coin3Intro(),
      sublevelCount: 10,
      levelNumber: 3,
    ),
    const CoinStackTemplate(
      title: "Coin 4: Where to Save Your Money",
      transfer: Coin4Where(),
      sublevelCount: 9,
      levelNumber: 4,
    ),
    Coin5(),
    const CoinStackTemplate(
      title: "Coin 6: What are Assets?",
      transfer: Coin6Intro(),
      sublevelCount: 6,
      levelNumber: 6,
    ),
    const CoinStackTemplate(
      title: "Coin 7: Depreciating/Appreciating Assets",
      transfer: Coin7Intro(),
      sublevelCount: 7,
      levelNumber: 7,
    ),
    const CoinStackTemplate(
      title: "Coin 8: What are Liabilities",
      transfer: Coin8Intro(),
      sublevelCount: 11,
      levelNumber: 8,
    ),
    const CoinStackTemplate(
      title: "Coin 9: Net Worth",
      transfer: Coin9Intro(isRepeat: false),
      sublevelCount: 10,
      levelNumber: 9,
    ),
    Coin10(),
    const CoinStackTemplate(
      title: "Coin 11: Good vs Bad Debt",
      transfer: Coin11Intro(),
      sublevelCount: 10,
      levelNumber: 11,
    ),
    const CoinStackTemplate(
      title: "Coin 12: What is a Credit Card",
      transfer: Coin12intro(),
      sublevelCount: 10,
      levelNumber: 12,
    ),
    const CoinStackTemplate(
      title: "Coin 13: Types of Credit Cards",
      transfer: Coin13intro(),
      sublevelCount: 10,
      levelNumber: 13,
    ),
    const CoinStackTemplate(
      title: "Coin 14: How to Use Credit Cards",
      transfer: Coin14Intro(),
      sublevelCount: 7,
      levelNumber: 14,
    ),
    Coin15()
  ];

  Widget _buildCoinLevel(
      BuildContext context, Alignment alignment, String label,
      {bool isFirst = false, required int index}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const textStyle = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        );

        final textSpan = TextSpan(
          text: label,
          style: textStyle,
        );

        final textPainter = TextPainter(
          textAlign: TextAlign.center,
          text: textSpan,
          maxLines: 2,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(maxWidth: constraints.maxWidth - 160);

        int lives = Provider.of<LivesProvider>(context).lives;

        return Consumer<ProgressProvider>(
          builder: (context, progressProvider, child) {
            bool isSelected = progressProvider.level - 1 == index;
            return Container(
              alignment: alignment,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: isFirst
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            if (isSelected)
                            (index <= 5)?
                              Image.asset(
                                'assets/hexagon.png',
                                width: 110,
                                height: 110,
                              ):

                              ColorFiltered(
                                colorFilter: ColorFilter.mode((index < 10)?const Color(0xff6327DB): const Color.fromARGB(255, 61, 121, 231), BlendMode.srcIn),
                                child: Image.asset(
                                  'assets/hexagon.png',
                                  width: 110,
                                  height: 110,
                                ),
                              ),
                            IconButton(
                              onPressed: () {
                                if (lives != 0) {
                                  if (Provider.of<ProgressProvider>(context,
                                              listen: false)
                                          .level >=
                                      index) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => _pages[index],
                                      ),
                                    );
                                  } else {
                                    //Handle the case where the coin is not equal to index, e.g., show a dialog
                                    showDialog(
                                      context: context,
                                      builder: (context) => DismissibleDialog(),
                                    );

                                  }
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Ghost(),
                                    ),
                                  );
                                }
                              },
                              icon: Image.asset(
                                (index < 5) ? _coinImage[0] : _coinImage[1],
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 80),
                        if (kIsWeb) const SizedBox(width: 20),
                        Flexible(
                          child: Text(
                            label,
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            label,
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                        ),
                        if (!isFirst) const SizedBox(width: 50),
                        if (kIsWeb) const SizedBox(width: 50),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            if (isSelected)
                              if (isSelected)
                            (index < 5)?
                              Image.asset(
                                'assets/hexagon.png',
                                width: 110,
                                height: 110,
                              ):
                              ColorFiltered(
                                colorFilter: const ColorFilter.mode(Color(0xff6327DB), BlendMode.srcIn),
                                child: Image.asset(
                                  'assets/hexagon.png',
                                  width: 110,
                                  height: 110,
                                ),
                              ),
                            IconButton(
                              onPressed: () {
                                if (lives != 0) {
                                  if (Provider.of<ProgressProvider>(context,
                                              listen: false)
                                          .level >=
                                      index) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => _pages[index],
                                      ),
                                    );
                                  } else {
                                    //Handle the case where the coin is not equal to index, e.g., show a dialog
                                    showDialog(
                                      context: context,
                                      builder: (context) => DismissibleDialog(),
                                    );

                                  }
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Ghost(),
                                    ),
                                  );
                                }
                              },
                              icon: Image.asset(
                                (index < 5) ? _coinImage[0] : _coinImage[1],
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}

//This is for the dotted line that connects each coin
class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(size.width * 0.2, 70);
    path.quadraticBezierTo(size.width * 0.5, 120, size.width * 0.8, 145);
    path.quadraticBezierTo(size.width * 0.5, 250, size.width * 0.2, 270);
    path.quadraticBezierTo(size.width * 0.5, 310, size.width * 0.8, 380);
    path.quadraticBezierTo(size.width * 0.5, 420, size.width * 0.2, 510);

    final dashedPath = dashPath(
      path,
      dashArray: CircularIntervalList<double>([5.0, 5.0]),
    );

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//If the user tries to access a level that they are not on, it will call this dialog.
class DismissibleDialog extends StatelessWidget {
  const DismissibleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Woah slow down there! Complete your last coin!'),
      content: const Text('Tap on the screen or press "OK" to dismiss.'),
      icon: Image.asset(
        'assets/wawaCoach.png', //image of wawa
        width: 40,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
