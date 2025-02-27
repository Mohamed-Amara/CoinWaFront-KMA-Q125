import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/leader_provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';

import 'package:provider/provider.dart';

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({super.key});

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  late PageController _pageController;
  late Future<void> _futureFetch;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedTab);

    // Delay fetching data to avoid calling context.read<T>() in initState()
    Future.delayed(Duration.zero, () {
      setState(() {
        _futureFetch =
            context.read<LeaderProvider>().fetchUserData(context, true);
      });

      context.read<ProfileProvider>().fetchUserData(context);
      context.read<CoinProvider>().fetchUserData(context);
    });
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTab = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

      // Fetch leaderboard data based on selected tab
      _futureFetch = context
          .read<LeaderProvider>()
          .fetchUserData(context, index == 0);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  Widget leaderblock(String imagepath, String username, int followers,
      int coinNum, int position) {
    return Column(
      children: [
        if (position == 3) const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '#${position + 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.asset(imagepath, width: 80),
            Column(
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$followers followers',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$coinNum',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/flatcoin.png', width: 60),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width * 0.9,
            height: 2,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 228, 255),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            // Header with Larger Text
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
            // Smaller Tab Bar Container
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40), // Less horizontal padding
              child: Container(
                height: 35, // Reduced height
                decoration: BoxDecoration(
                  color: const Color(0xFFDAD6F8), // Light purple background
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(3), // Adds spacing inside the container
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAEAF5), // Inner purple background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Make the row fit the content
                    children: [
                      _buildTabButton('Global', 0),
                      _buildTabButton('Friends', 1),
                    ],
                  ),
                ),
              ),
            ),




            // Tab Content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                children: [
                  _buildTabView(true),
                  _buildTabView(false),
                ],
              ),
            ),
            const BottomBar(initialIndex: 2),
          ],
        ),
      ),

    );
  }

  Widget _buildTabButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabChanged(index),
        child: Container(
          height: 30, // Adjusted to match the container
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _selectedTab == index ? const Color(0xFF7870DE) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12, // Smaller font size
              fontWeight: FontWeight.w600,
              color: _selectedTab == index ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }





  Widget _buildTabView(bool isGlobal) {
    return FutureBuilder<void>(
      future: _futureFetch,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return Container(
          color: isGlobal
              ? Colors.transparent
              : const Color.fromARGB(255, 182, 211, 255),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Top 3 Leaderboard
                      Consumer<LeaderProvider>(
                        builder: (context, leaderProvider, child) {
                          if (leaderProvider.username.isEmpty) {
                            return const CircularProgressIndicator();
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // First Place
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                // Profile Picture (Placed higher above the box)
                                Positioned(
                                  top: -50, // Raised the image higher
                                  child: Container(
                                    width: 80, // Profile image size
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFF9E9E9E), // Placeholder color
                                      border: Border.all(
                                        color: const Color(0xFF3A0066), // Darker purple border
                                        width: 4,
                                      ),
                                    ),
                                    child: leaderProvider.username.length < 2
                                        ? const SizedBox()
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(40), // Ensures no oval stretching
                                      child: Image.asset(
                                        leaderProvider.pfp[1],
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                                // Main Leaderboard Box with lighter purple and dark purple border on top
                                Container(
                                  width: 120,
                                  height: 120, // Adjusted to fit just the name and number
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF9370DB), // Lighter Purple
                                    borderRadius: BorderRadius.circular(15),
                                    border: const Border(
                                      top: BorderSide(
                                        color: Color(0xFF4B0082), // Darker purple border on top
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(top: 40), // Adjusted for better alignment
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Display number "2" (HUGE)
                                      const Text(
                                        "2",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40, // Made it much bigger
                                          color: Colors.amber, // Highlighted color for rank
                                        ),
                                      ),
                                      const SizedBox(height: 5), // Spacing

                                      // Display Username
                                      Text(
                                        (leaderProvider.username.length < 2) ? "" : leaderProvider.username[1],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white, // Ensure visibility
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Second Place
                            Stack(
                              alignment: AlignmentDirectional(0, -2),
                              children: [
                                Container(
                                  width: 120,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFD700),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: (leaderProvider.username.length < 1)
                                            ? Text(""):Image.asset(
                                      leaderProvider.pfp[0],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  child: Column(
                                    children: [
                                      Text(
                                        (leaderProvider.username.length < 1)
                                            ? ""
                                            : leaderProvider.username[0],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        (leaderProvider.username.length < 1)
                                            ? ""
                                            : '${leaderProvider.followers[0]} followers',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        (leaderProvider.username.length < 1)
                                            ? ""
                                            : leaderProvider.coins[0].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Third Place
                            Stack(
                              alignment: AlignmentDirectional(0, -5),
                              children: [
                                Container(
                                  width: 120,
                                  height: 130,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFCD7F32),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(15),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 165, 100, 36),
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: (leaderProvider.username.length < 3)
                                            ? Text(""):Image.asset(
                                      leaderProvider.pfp[2],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  child: Column(
                                    children: [
                                      Text(
                                        (leaderProvider.username.length < 3)
                                            ? ""
                                            : leaderProvider.username[2],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        (leaderProvider.username.length < 3)
                                            ? ""
                                            : '${leaderProvider.followers[2]} followers',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        (leaderProvider.username.length < 3)
                                            ? ""
                                            : leaderProvider.coins[2].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xff4C4B39EF),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                    child: Consumer<LeaderProvider>(
                      builder: (context, leaderProvider, child) {
                        final userCount = leaderProvider.username.length;
                    
                        if (userCount <= 3) {
                          return const Center(child: Text('No more users to display'));
                        }
                    
                        return ListView.builder(
                          itemCount: userCount - 3, // Adjusting for the top 3
                          itemBuilder: (context, index) {
                            final adjustedIndex = index + 3; // Skip the top 3
                            return leaderblock(
                              leaderProvider.pfp[adjustedIndex],
                              leaderProvider.username[adjustedIndex],
                              leaderProvider.followers[adjustedIndex],
                              leaderProvider.coins[adjustedIndex],
                              adjustedIndex,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
