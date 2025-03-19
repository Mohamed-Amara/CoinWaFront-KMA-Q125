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
import 'package:flutter_application_1/Unit4/Coin16/coin16-intro.dart';
import 'package:flutter_application_1/Unit4/Coin17/coin17-intro.dart';
import 'package:flutter_application_1/Unit4/Coin18/coin18-intro.dart';
import 'package:flutter_application_1/Unit4/Coin19/coin19-intro.dart';
import 'package:flutter_application_1/Unit4/coin20.dart';
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
import 'package:flutter_application_1/CoinEnd.dart';

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

//need this to be global in this file
List<String> titles = [
  "Saving",
  "Assets/Liabilities",
  "Credit Cards",
  "Taxes",
  "This Isn't the End!"
];

// Color function for other units
Color _getColorForUnit(int unit) {
  switch (unit) {
    case 0:
      return const Color(0xff21945C);
    case 1:
      return const Color(0xFF7870DE);
    case 2:
      return const Color.fromARGB(255, 61, 121, 231);
    case 3:
      return const Color.fromARGB(255, 231, 61, 61);
    case 4:
      return const Color(0xFF7B73DF); // Gradient takes over when unit == 3
    default:
      return const Color(0xff21945C);
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
    const Color.fromARGB(255, 231, 61, 61),
    const Color(0xFF7B73DF)
  ];

//The coin itself has an imprint that changes based on level. Add more to the list if you want to add more levels
  final List<String> _coinImage = [
    "assets/wallet_coin.png",
    "assets/coin_level.png"
  ];
  final ScrollController _scrollController =
      ScrollController(); //Let's you observe scrolling information on the page
  // List<String> titles = [
  //   "Saving",
  //   "Assets/Liabilities",
  //   "Credit Cards",
  //   "This isn't the end!"
  // ]; //Titles of all the units
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
    const changeColorPosition1 = 550;
    const changeColorPosition2 = 1100;
    const changeColorPosition3 = 1650;
    const changeColorPositionEnd = 2200; // Position for End Coin

    int newUnit = 0;

    if (scrollPosition >= changeColorPositionEnd) {
      newUnit = titles.length - 1; // Special case for End Coin
    } else if (scrollPosition >= changeColorPosition3) {
      newUnit = 3;
    } else if (scrollPosition >= changeColorPosition2) {
      newUnit = 2;
    } else if (scrollPosition > changeColorPosition1) {
      newUnit = 1;
    } else {
      newUnit = 0;
    }

    if (newUnit != unit) {
      setState(() {
        unit = newUnit;
        _titleColor = _getColorForUnit(unit);
      });
    }
  }

//This is the main build method

  @override
  Widget build(BuildContext context) {
    final double containerWidth = min(MediaQuery.of(context).size.width,
        500); //MediaQuery.of(context).size.width basically fetches the width of the screen you are using the app on
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
                      _buildHorizontalLine(titles[3]),
                      _buildUnit4(context),
                      _buildHorizontalLine(titles[titles.length - 1]),
                      _buildEnd(context),
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedGradientBackground(currentUnit: unit),
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
                      padding: const EdgeInsets.only(
                          bottom: 15), // Keep overall position
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Ensure all elements align at the bottom
                        children: [
                          // Coins (Text → Icon)
                          Row(
                            children: [
                              Text(
                                '${context.watch<CoinProvider>().coin}',
                                style: const TextStyle(
                                  color: Color(0xFFEFEBEB),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/wacoin.png',
                                width: 40,
                                height: 40,
                              ),
                            ],
                          ),

                          const SizedBox(
                              width:
                                  0), // Reduced spacing to bring everything closer

                          // Streak (Icon Below, Number Above)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Wrap the image in a Transform widget to move it downward
                              Transform.translate(
                                offset: const Offset(0,
                                    55), // Adjust the Y offset to move the icon down
                                child: Image.asset(
                                  () {
                                    if (context
                                            .watch<ProfileProvider>()
                                            .streak >=
                                        30) {
                                      return 'assets/very_fire_wawa.png';
                                    } else if (context
                                            .watch<ProfileProvider>()
                                            .streak >=
                                        7) {
                                      return 'assets/fire_wawa.png';
                                    } else if (context
                                            .watch<ProfileProvider>()
                                            .streak >=
                                        5) {
                                      return 'assets/slight_fire_wawa.png';
                                    } else if (context
                                            .watch<ProfileProvider>()
                                            .streak >=
                                        3) {
                                      return 'assets/wawa.png';
                                    } else if (context
                                            .watch<ProfileProvider>()
                                            .streak >=
                                        1) {
                                      return 'assets/ice_wawa.png';
                                    } else {
                                      return 'assets/ice_wawa.png';
                                    }
                                  }(),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      2), // Small spacing between icon and text
                              Transform.translate(
                                offset: const Offset(0,
                                    10), // Move the streak number down by 10 pixels
                                child: Text(
                                  '${context.watch<ProfileProvider>().streak}',
                                  style: const TextStyle(
                                    color: Color(0xFFEFEBEB),
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 0), // Reduced spacing

                          // Lives (Icon → Text)
                          Row(
                            children: [
                              LivesWidget(
                                  lives: context.watch<LivesProvider>().lives),
                              const SizedBox(width: 5),
                              Text(
                                '${context.watch<LivesProvider>().lives}',
                                style: const TextStyle(
                                  color: Color(0xFFEFEBEB),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                      setState(() {
                        //set state is necessary for real-time updates on the screen (can only use with Stateful widget)
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
                          MaterialPageRoute(builder: (context) => PigShelf()),
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
          _buildCoinLevel(context, Alignment.centerLeft, "Piggy Bank 1 End",
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
          _buildCoinLevel(context, Alignment.centerLeft, "What Are Assets?",
              index: 5, isFirst: true),
          _buildCoinLevel(context, Alignment.centerRight,
              "Depreciating/Appreciating Assets",
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
          _buildCoinLevel(
              context, Alignment.centerRight, "What is a Credit Card",
              index: 11),
          _buildCoinLevel(
              context, Alignment.centerLeft, "Types of Credit Cards",
              index: 12, isFirst: true),
          _buildCoinLevel(
              context, Alignment.centerRight, "How to Get a Credit Card",
              index: 13),
          _buildCoinLevel(context, Alignment.centerLeft, "Piggy Bank 3 End",
              index: 14, isFirst: true),
        ],
      ),
    );
  }
  Widget _buildUnit4(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
      child: Column(
        children: <Widget>[
          _buildCoinLevel(
              context, Alignment.centerLeft, "What are Taxes",
              index: 15, isFirst: true),
          _buildCoinLevel(
              context, Alignment.centerRight, "Income Tax",
              index: 16),
          _buildCoinLevel(
              context, Alignment.centerLeft, "Tax Deductions",
              index: 17, isFirst: true),
          _buildCoinLevel(
              context, Alignment.centerRight, "Your Taxes",
              index: 18),
          _buildCoinLevel(context, Alignment.centerLeft, "Piggy Bank 4 End",
              index: 19, isFirst: true),
        ],
      ),
    );
  }

  Widget _buildEnd(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Consumer<ProgressProvider>(
        builder: (context, progressProvider, child) {
          bool canAccessEndCoin = progressProvider.level >= 20;
          bool isSelected = progressProvider.level == 21;

          return Column(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (canAccessEndCoin) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoinEnd()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => DismissibleDialog(),
                      );
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isSelected)
                        ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Color.fromARGB(255, 61, 121, 231),
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            'assets/hexagon.png',
                            width: 300,
                            height: 300,
                          ),
                        ),
                      Column(
                        children: [
                          const Text(
                            "HANG ON TIGHT!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(58, 51, 134, 0.612),
                            ),
                          ),
                          Opacity(
                            opacity: canAccessEndCoin ? 1.0 : 0.5,
                            child: Image.asset(
                              'assets/confet_coin.png',
                              width: 300,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          );
        },
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
    Coin15(),
    const CoinStackTemplate(
      title: "Coin 16: What are Taxes",
      transfer: Coin16Intro(),
      sublevelCount: 10, // need to change
      levelNumber: 16,
    ),
    const CoinStackTemplate(
      title: "Coin 12: What is a Credit Card",
      transfer: Coin17Intro(),
      sublevelCount: 10,//need to change
      levelNumber: 17,
    ),
    const CoinStackTemplate(
      title: "Coin 13: Types of Credit Cards",
      transfer: Coin18Intro(),
      sublevelCount: 10, //need to change
      levelNumber: 18,
    ),
    const CoinStackTemplate(
      title: "Coin 19: Taxes and You",
      transfer: Coin19Intro(), //need to change
      sublevelCount: 11,
      levelNumber: 19,
    ),
    Coin20(),
    const CoinEnd()
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
                              (index <= 5)
                                  ? Image.asset(
                                      'assets/hexagon.png',
                                      width: 110,
                                      height: 110,
                                    )
                                  : ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                          (index < 10)
                                              ? const Color(0xff6327DB)
                                              : const Color.fromARGB(
                                                  255, 61, 121, 231),
                                          BlendMode.srcIn),
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
                                        builder: (context) {
                                          if (index >= _pages.length) {
                                            print(
                                                "🚨 ERROR: Trying to access _pages[$index] but length is ${_pages.length}");
                                            return const Scaffold(
                                              body: Center(
                                                  child: Text(
                                                      "Error: Page Not Found")),
                                            );
                                          } else {
                                            print(
                                                "✅ Navigating to _pages[$index] (Valid range: 0-${_pages.length - 1})");
                                            return _pages[index];
                                          }
                                        },
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
                                (index < 5)
                                    ? Image.asset(
                                        'assets/hexagon.png',
                                        width: 110,
                                        height: 110,
                                      )
                                    : ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                            Color(0xff6327DB), BlendMode.srcIn),
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
                                        builder: (context) {
                                          if (index >= _pages.length) {
                                            print(
                                                "🚨 ERROR: Trying to access _pages[$index] but length is ${_pages.length}");
                                            return const Scaffold(
                                              body: Center(
                                                  child: Text(
                                                      "Error: Page Not Found")),
                                            );
                                          } else {
                                            print(
                                                "✅ Navigating to _pages[$index] (Valid range: 0-${_pages.length - 1})");
                                            return _pages[index];
                                          }
                                        },
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

class DaVinci extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Start at the last coin (Piggy Bank 3 End)
    path.moveTo(size.width * 0.5, 20);

    // Curve downward towards the End Coin
    path.quadraticBezierTo(size.width * 0.5, 80, size.width * 0.55, 130);

    // Final smooth transition into the piggy bank
    path.quadraticBezierTo(size.width * 0.55, 200, size.width * 0.5, 280);

    final dashedPath = dashPath(
      path,
      dashArray: CircularIntervalList<double>([10.0, 12.0]),
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

class AnimatedGradientBackground extends StatefulWidget {
  final int currentUnit; // Track the unit number
  const AnimatedGradientBackground({Key? key, required this.currentUnit})
      : super(key: key);

  @override
  _AnimatedGradientBackgroundState createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Faster transition
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: const Color.fromARGB(255, 148, 142, 223), // Deep Purple
      end: const Color(0xFF5D50C8), // Slightly lighter Purple
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Only animate when unit == 3
    bool shouldAnimate = widget.currentUnit == 4;

    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: shouldAnimate
                  ? [
                      _colorAnimation.value ?? const Color(0xFF7B73DF),
                      const Color(0xFF5D50C8), // Lighter Purple
                      _colorAnimation.value ?? const Color(0xFF7B73DF),
                    ]
                  : [
                      _getColorForUnit(widget.currentUnit),
                      _getColorForUnit(widget.currentUnit)
                    ], // Regular color if not last unit
            ),
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
                  'Piggy Bank ${widget.currentUnit + 1}:',
                  style: const TextStyle(
                    fontFamily: "Serif",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                titles[widget.currentUnit],
                style: const TextStyle(
                  fontFamily: "Serif",
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
