//Errors RN: not working: coin values on podium or list, rank values

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/leader_provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';
import 'package:provider/provider.dart';

// LeaderboardWidget is a StatefulWidget that displays a leaderboard with two tabs: Global and Friends.
class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({super.key});

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget>
    with TickerProviderStateMixin {
  late TabController _tabBarController; // Controls the tab navigation
  late Future<void> _futureFetch; // Future to handle asynchronous data fetching
  int _selectedTab = 0; // Index for the selected tab

  @override
  void initState() {
    super.initState();

    // Initialize the TabController with 2 tabs (Global and Friends)
    _tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() {
      // When the tab changes, fetch new data based on the selected tab
      setState(() {
        _futureFetch = context
            .read<LeaderProvider>()
            .fetchUserData(context, _tabBarController.index == 0);
      });
    });

    // Fetch initial data for the Global leaderboard
    _futureFetch = context.read<LeaderProvider>().fetchUserData(context, true);

    // Fetch profile and coin data after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().fetchUserData(context);
      context.read<CoinProvider>().fetchUserData(context);
    });
  }

  @override
  void dispose() {
    _tabBarController.dispose(); // Dispose the TabController to avoid memory leaks
    super.dispose();
  }

  // Helper method to create a leaderboard block for a user
  Widget leaderblock(String imagepath, String username, int coinNum,
      int position, int adjustedIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 6), // Adds spacing between users
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 16, horizontal: 12), // Adds internal padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ranking number inside a dark blue circle
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.indigo[800],
                shape: BoxShape.circle,
              ),
              child: Text(
                '$position',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Profile picture (circular, no border)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagepath,
                  width: 40, height: 40, fit: BoxFit.cover),
            ),
            const SizedBox(width: 14),

            // Username and coin count (left aligned)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$coinNum Coins',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            // Coin icon
            Image.asset('assets/flatcoin.png', width: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
      const Color.fromARGB(255, 255, 255, 255), // Set background color
      body: SafeArea(
        top: true,
          child: Column(
            children: [
              // Custom App Bar with Curved Bottom
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 15,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: screenWidth,
                      height: 150, // Increased height for a longer banner
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(
                            255, 118, 121, 185), //rgb(118, 121, 185)
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    height:
                    150, // Increased height for the banner to match the first container
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color:
                      Color.fromARGB(255, 160, 161, 251), //rgb(160, 161, 251)
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30), // Increased space before the text
                        Text(
                          "Leaderboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height:
                            20), // Extra space between the text and the bottom
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20), // Adds spacing below the header

              // Tab Bar for Global & Friends Leaderboard
              // Smaller Tab Bar Container
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                child: Container(
                  height: 25, // Same height as the button
                  decoration: BoxDecoration(
                    color: const Color(0xFFDAD6F8), // Light purple background
                    borderRadius: BorderRadius.circular(8), // Same shape as the button
                  ),
                  padding: const EdgeInsets.all(2), // Slight padding for spacing
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAEAF5), // Inner background (consistent with buttons)
                      borderRadius: BorderRadius.circular(8), // Same rounded corners as the button
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
              ),


  // TabBarView for Leaderboard Content
              Expanded(
                child: IndexedStack(
                  index: _selectedTab, // Show the selected tab's content
                  children: [
                    _buildTabView(true), // Global leaderboard
                    _buildTabView(false), // Friends leaderboard
                  ],
                ),
              ),

              // Bottom Section for Current User's Rank
              Consumer<ProfileProvider>(
                builder: (context, profileProvider, child) {
                  if (profileProvider.username.isEmpty ||
                      profileProvider.profilepic.isEmpty) {
                    return const CircularProgressIndicator(); // Show loading indicator if data is not ready
                  }
                  return Container(
                    color: _tabBarController.index == 0
                        ? const Color.fromARGB(255, 168, 160, 243)
                        : const Color.fromARGB(255, 168, 160, 243),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // User Rank
                          Text(
                            '${context.watch<LeaderProvider>().position}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Profile Picture
                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(40), // Make it round
                            child: Image.asset(profileProvider.profilepic,
                                width: 40, height: 40, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 20),
                          // Username & Followers
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileProvider.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${profileProvider.followerNum} followers',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          // Coin Count
                          Text(
                            context.watch<CoinProvider>().coin.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Image.asset('assets/flatcoin.png', width: 24),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const BottomBar(initialIndex: 2),
    );
  }

  Widget _buildTabButton(String text, int index) {
    return GestureDetector(
      onTap: () => _onTabChanged(index),
      child: Container(
        width: 80, // Adjust width for a more compact design
        height: 25, // Reduce height
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _selectedTab == index ? const Color(0xFF7870DE) : Colors.transparent,
          borderRadius: BorderRadius.circular(8), // Less rounded for a rectangular look
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12, // Smaller text size
            fontWeight: FontWeight.w500, // Slightly lighter font weight
            color: _selectedTab == index ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }


// Function to handle tab selection change
  void _onTabChanged(int index) {
    setState(() {
      _selectedTab = index; // Update the selected tab index
      _tabBarController.index = index;
    });
  }

  // Helper method to build the content of the selected tab
// Helper method to build the content of the selected tab
  Widget _buildTabView(bool isGlobal) {
    return FutureBuilder<void>(
      future: _futureFetch,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child:
              CircularProgressIndicator()); // Show loading indicator while fetching data
        }
        if (snapshot.hasError) {
          return Center(
              child: Text(
                  'Error: ${snapshot.error}')); // Show error message if data fetching fails
        }

        return Container(
          color: isGlobal ? Colors.transparent : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Display the top 3 users in the leaderboard
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Consumer<LeaderProvider>(
                        builder: (context, leaderProvider, child) {
                          if (leaderProvider.username.isEmpty) {
                            return const CircularProgressIndicator(); // Show loading indicator if data is not ready
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // First Place
                              _buildLeaderboardPodium(
                                leaderProvider.pfp[1],
                                leaderProvider.username[1],
                                leaderProvider.followers[1],
                                leaderProvider.coins[1],
                                2, // 2nd place
                              ),
                              _buildLeaderboardPodium(
                                leaderProvider.pfp[0],
                                leaderProvider.username[0],
                                leaderProvider.followers[0],
                                leaderProvider.coins[0],
                                1, // 1st place
                              ),
                              _buildLeaderboardPodium(
                                leaderProvider.pfp[2],
                                leaderProvider.username[2],
                                leaderProvider.followers[2],
                                leaderProvider.coins[2],
                                3, // 3rd place
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Display the rest of the users in a list
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xff4c4b39ef),
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
                          return const Center(
                              child: Text(
                                  'No more users to display')); // Show message if no more users are available
                        }

                        return ListView.builder(
                          itemCount: userCount - 3, // Adjusting for the top 3
                          itemBuilder: (context, index) {
                            final adjustedIndex = index + 3; // Skip the top 3
                            return leaderblock(
                              leaderProvider.pfp[adjustedIndex],
                              leaderProvider.username[adjustedIndex],
                              leaderProvider.coins[adjustedIndex],
                              adjustedIndex+1,
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

  // Helper method to build a podium block for the top 3 users
  Widget _buildLeaderboardPodium(String imagepath, String username,
      int followers, int coinNum, int position) {
    Color podiumColor;
    double fontSize1 = 0;
    Color borderColor;

    // Assign the color based on the position
    if (position == 1) {
      podiumColor = const Color.fromARGB(
          255, 241, 182, 106); // Gold for 1st place rgb(241, 182, 106)
      borderColor = const Color.fromARGB(255, 196, 152, 88); //rgb(196, 152, 88)
      fontSize1 = 70;
    } else if (position == 2) {
      podiumColor = const Color.fromARGB(
          255, 129, 89, 238); // Silver for 2nd place rgb(129, 89, 238)
      borderColor = const Color.fromARGB(255, 106, 77, 177); //rgb(106, 77, 177)
      fontSize1 = 50;
    } else {
      podiumColor = const Color.fromARGB(
          255, 153, 165, 248); // Bronze for 3rd place rgb(153, 165, 248)
      borderColor =
      const Color.fromARGB(255, 112, 114, 179); //rgb(112, 114, 179)
      fontSize1 = 40;
    }

    return Column(
      mainAxisSize: MainAxisSize
          .min, // Ensures the column takes up only the required space
      children: [
        // The user's profile picture on top of the podium
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: podiumColor.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: imagepath.isEmpty
                ? const Text("")
                : Image.asset(
              imagepath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between the avatar and the podium
        // The podium box with text inside it
        Container(
          width: 120,
          height: position == 1
              ? 220 // First place is taller
              : position == 2
              ? 170 // Second place is a bit taller
              : 150, // Third place is the same height
          decoration: BoxDecoration(
            color: podiumColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
            border: Border(
              top: BorderSide(color: borderColor, width: 10),
              right: BorderSide(color: borderColor, width: 10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
                8.0), // Adjust padding for text positioning
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.end, // Align text to the bottom
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display the position
                Text(
                  position.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize1, // Adjusted font size for position
                      color: Colors.white),
                ),
                // Display the username
                Text(
                  username,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Adjusted font size for username
                      color: Colors.white),
                ),
                // Display the coin number
                Text(
                  "$coinNum Coins", //context.watch<CoinProvider>().coin.toString()
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12, // Adjusted font size for coin number
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}