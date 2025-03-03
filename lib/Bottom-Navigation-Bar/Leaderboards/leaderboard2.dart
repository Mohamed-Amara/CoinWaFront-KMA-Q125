import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';
import 'package:flutter_application_1/Providers/leader_provider.dart';
import 'package:provider/provider.dart';

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({super.key});

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  int _selectedTab = 0;
  late Future<void> _futureFetch;

  @override
  void initState() {
    super.initState();
    _futureFetch = context.read<LeaderProvider>().fetchUserData(context, true);
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTab = index;
      _futureFetch =
          context.read<LeaderProvider>().fetchUserData(context, index == 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 228, 255),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120, // Increased height
                    decoration: const BoxDecoration(
                      color: Color(0xff7870de),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30), // Adjusted spacing
                      Text(
                        'Leaderboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32, // Increased font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildTabButtons(),
            Expanded(child: _buildLeaderboard()),
            const BottomBar(initialIndex: 2),
          ],
        ),
      ),
    );
  }

  // ✅ New Tab Button Styling
  Widget _buildTabButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: const Color(0xFFDAD6F8),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEAEAF5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTabButton('Global', 0),
              _buildTabButton('Friends', 1),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Global & Friends Button Styling
  Widget _buildTabButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabChanged(index),
        child: Container(
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _selectedTab == index ? const Color(0xFF7870DE) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: _selectedTab == index ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboard() {
    return FutureBuilder<void>(
      future: _futureFetch,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return Consumer<LeaderProvider>(
          builder: (context, leaderProvider, child) {
            return Column(
              children: [
                const SizedBox(height: 20),
                buildTopThree(leaderProvider),
                const SizedBox(height: 20),
                buildLeaderboardList(leaderProvider),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildTopThree(LeaderProvider leaderProvider) {
    if (leaderProvider.username.isEmpty) return const CircularProgressIndicator();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildPodiumBar(leaderProvider, 1, Colors.purple, 100, 2),
        _buildPodiumBar(leaderProvider, 0, Colors.amber, 130, 1),
        _buildPodiumBar(leaderProvider, 2, Colors.brown, 90, 3),
      ],
    );
  }

  Widget _buildPodiumBar(LeaderProvider leaderProvider, int index, Color barColor, double barHeight, int rank) {
    if (leaderProvider.username.length <= index) return const SizedBox();

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          child: ClipOval(
            child: Image.asset(
              leaderProvider.pfp[index],
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 90,
          height: barHeight,
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text(
            '$rank',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Text(
                leaderProvider.username[index],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                '${leaderProvider.coins[index]} Coins',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLeaderboardList(LeaderProvider leaderProvider) {
  final userCount = leaderProvider.username.length;

  if (userCount <= 3) {
    return const Center(child: Text('No more users to display'));
  }

  return Expanded(
  child: Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Color(0xFFDAD6F8), // Matches your provided image color
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: ListView.builder(
      itemCount: userCount - 3, // Skip the top 3
      itemBuilder: (context, index) {
        final adjustedIndex = index + 3; // Start from 4th place

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        leaderProvider.pfp[adjustedIndex],
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    leaderProvider.username[adjustedIndex],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Text(
                '${leaderProvider.coins[adjustedIndex]} Coins',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        );
      },
    ),
  ),
);

}

}
