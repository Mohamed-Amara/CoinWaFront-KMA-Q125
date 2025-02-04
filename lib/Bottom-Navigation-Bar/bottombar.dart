import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Leaderboards/leaderboard.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Leaderboards/leaderboard2.dart';
import 'package:flutter_application_1/lobby.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/pigshelf.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/profile.dart';

class BottomBar extends StatefulWidget {
  final int initialIndex;
  const BottomBar({Key? key, required this.initialIndex}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LobbyPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PigShelf()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LeaderboardWidget()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFEFEBEB),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: _selectedIndex == 0
                  ? const Color.fromARGB(255, 213, 210, 250)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.home, color: Color(0xFFA39CD6)),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: _selectedIndex == 1
                  ? const Color.fromARGB(255, 213, 210, 250)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: const ImageIcon(AssetImage('assets/stacked_pig.png'),
                color: Color(0xFFA39CD6)),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: _selectedIndex == 2
                  ? const Color.fromARGB(255, 213, 210, 250)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.emoji_events, color: Color(0xFFA39CD6)),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: _selectedIndex == 3
                  ? const Color.fromARGB(255, 213, 210, 250)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.person, color: Color(0xFFA39CD6)),
          ),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF7870DE),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      onTap: _onItemTapped,
    );
  }
}
