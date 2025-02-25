import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Login-Logout/logout.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  final PageController _pageController = PageController();
  final List<String> badgeImages = [
    "assets/Badges/baby.png",
    "assets/Badges/early.png",
    "assets/Badges/finwhiz.png",
    "assets/Badges/piggybank.png",
    "assets/Badges/pretty.png",
    "assets/Badges/welcome.png",
  ];

  @override
  void initState() {
    super.initState();
    // Ensure that the PageView loops infinitely
    _pageController.addListener(() {
      if (_pageController.page == badgeImages.length - 1) {
        _pageController.jumpToPage(0);
      } else if (_pageController.page == 0) {
        _pageController.jumpToPage(badgeImages.length - 1);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.purple.shade50, // Light purple background
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return FutureBuilder(
            future: profileProvider.initialization,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator()); // Show loading spinner
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return SafeArea(
                  // Wrap the content in SafeArea to avoid UI overlaps
                  child: SingleChildScrollView(
                    // Wrap the entire content in a scrollable widget
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile header section
                        Stack(
                          clipBehavior: Clip
                              .none, // Allows the second container to extend beyond the first
                          children: [
                            // Bottom Layer - Darker shade for depth
                            Positioned(
                              top:
                                  20, // Pushes this layer slightly lower to create the effect
                              left: 0,
                              right: 0,
                              child: Container(
                                width: screenWidth,
                                height: 90, // Height of the shadow layer
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple
                                      .shade700, // Slightly darker purple for depth
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            // Top Layer - Main Banner
                            Container(
                              width: screenWidth,
                              height: 110,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Colors.purple, // Main banner color
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(height: 30),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: Colors
                                          .white, // White text for visibility
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  LogoutButton(), // Log out button
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        // Profile card with user details
                        Card(
                          color: Colors.purple.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(profileProvider
                                      .profilepic), // Profile picture
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  profileProvider.fullname, // User's name
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${Provider.of<CoinProvider>(context, listen: false).coin}', // Display coin balance
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _infoButton(
                                        "${profileProvider.followingNum} Following"),
                                    const SizedBox(width: 10),
                                    _infoButton(
                                        "${profileProvider.followerNum} Followers"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Goals Section
                        _goalSection(
                            "Streak",
                            profileProvider.streak.toDouble(),
                            30), // Streak progress
                        _goalSection(
                            "Your Current Level", 5, 10), // User level progress
                        _goalSection(
                            "Units Covered", 23, 100), // Covered units progress

                        const SizedBox(height: 20),
                        // Badges Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Badges",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Container with cyclic scroll for badges
                              Container(
                                height: 150, // Badge height adjusted
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: null, // Infinite scroll
                                  itemBuilder: (context, index) {
                                    int loopIndex = index %
                                        badgeImages
                                            .length; // Ensure cycling through badges
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: ClipOval(
                                        child: Image.asset(
                                          badgeImages[
                                              loopIndex], // Get the badge image
                                          width: 120, // Size of the badge
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
      bottomNavigationBar:
          const BottomBar(initialIndex: 3), // Bottom navigation bar
    );
  }

  // Helper function for displaying follow and following info
  Widget _infoButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.purple.shade700,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Helper function to create goal progress sections
  Widget _goalSection(String title, double value, double maxValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text("${value.toInt()}"), // Display current value
              Slider(
                value: value,
                min: 0,
                max: maxValue,
                activeColor: Colors.purple,
                inactiveColor: Colors.purple.shade100,
                onChanged: (newValue) {}, // Disabled slider
              ),
            ],
          ),
        ),
      ),
    );
  }
}
