import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Friends/friends.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/usercreate.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Login-Logout/logout.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      backgroundColor: Colors.purple.shade50,
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return FutureBuilder(
            future: profileProvider.initialization,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            // Profile header section
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
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 91, 24, 233),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth,
                                  height: 100,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 140, 82, 255),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 25),
                                      Text(
                                        "Profile",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 10),
                                LogoutButton(),
                                SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors
                              .transparent, // Make sure the Card does not have a white background
                          elevation: 0, // Remove shadow if needed
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                15), // Apply rounded corners properly
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/profileback.png"), // Ensure this path is correct
                                  fit: BoxFit.cover,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final selectedAvatar =
                                          await Navigator.push<String>(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UserCreate(),
                                        ),
                                      );
                                      if (selectedAvatar != null) {
                                        await profileProvider.updateProfilePicture(
                                            // ignore: use_build_context_synchronously
                                            context,
                                            selectedAvatar);
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage: AssetImage(
                                          profileProvider.profilepic),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    profileProvider.fullname,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Provider.of<CoinProvider>(context, listen: false).coin}',
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
                        ),

                        const SizedBox(height: 20),
                        _weeklyStreakIndicator(profileProvider.streakDays),
                        Consumer<ProgressProvider>(
                          builder: (context, progressProvider, child) {
                            return _goalSection("Your Current Level",
                                progressProvider.currentLevelInt as double, 15);
                          },
                        ),
                        Consumer<ProgressProvider>(
                          builder: (context, progressProvider, child) {
                            double unitProgress =
                                (((progressProvider.currentLevelInt) / 5))
                                    .ceil() as double;

                            return _goalSection(
                              "Your Current Unit",
                              unitProgress,
                              3,
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        // Badges section
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
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: badgeImages.length,
                                  itemBuilder: (context, index) {
                                    bool isUnlocked =
                                        index <= profileProvider.unlockedBadges;
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: ClipOval(
                                        child: Image.asset(
                                          badgeImages[index],
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                          color:
                                              isUnlocked ? null : Colors.grey,
                                          colorBlendMode: isUnlocked
                                              ? BlendMode.dstIn
                                              : BlendMode.saturation,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
      bottomNavigationBar: const BottomBar(initialIndex: 3),
    );
  }

  Widget _infoButton(String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FriendsWidget()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 97, 71, 197),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text("${value.toInt()}"),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 7,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                  overlayColor: Colors.transparent,
                ),
                child: Slider(
                  value: value,
                  min: 0,
                  max: maxValue,
                  activeColor: const Color.fromARGB(255, 140, 83, 255),
                  inactiveColor: Colors.purple.shade100,
                  onChanged: (newValue) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _weeklyStreakIndicator(List<bool> streakDays) {
    List<String> weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    print("streakDays received: $streakDays");

    // // Fetch streakDays safely
    // final profileProvider = Provider.of<ProfileProvider>(context, listen: true);
    // final List<bool> streakDays = profileProvider.streakDays ?? List.filled(7, false);

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
              const Text(
                "Weekly Streak",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  bool isActive = streakDays.length > index ? streakDays[index] : false;
                  return Column(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 30,
                        color: isActive
                            ? const Color.fromARGB(255, 140, 83, 255)
                            : const Color.fromARGB(255, 167, 152, 196),
                      ),
                      const SizedBox(height: 5),
                      Text(weekDays[index], style: const TextStyle(fontSize: 12)),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
