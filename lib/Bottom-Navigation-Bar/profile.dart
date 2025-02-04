import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/coin_provider.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Friends/friends.dart';
import 'package:flutter_application_1/Login-Logout/logout.dart';
import 'package:provider/provider.dart';
import 'usercreate.dart'; // Ensure this import points to the correct path

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    // Trigger data fetch when this widget is initialized
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).fetchUserData(context);
      Provider.of<CoinProvider>(context, listen: false).fetchUserData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> allBadges = [
      "assets/Badges/baby.png",
      "assets/Badges/early.png",
      "assets/Badges/finwhiz.png",
      "assets/Badges/piggybank.png",
      "assets/Badges/pretty.png",
      "assets/Badges/welcome.png"
    ];

    Widget badgeDisplay(String imagePath, {double opacity = 1.0}) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Opacity(
          opacity: opacity,
          child: Image.asset(
            imagePath,
            width: 80,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
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
                String username = profileProvider.username;
                String realname = profileProvider.fullname;
                int followers = profileProvider.followerNum;
                int following = profileProvider.followingNum;
                int streak = profileProvider.streak;
                String avatarImagePath = profileProvider.profilepic;
                List<String> achievedBadges = profileProvider.badges;

                // Remove achieved badges from allBadges
                for (String badge in achievedBadges) {
                  allBadges.remove(badge);
                }

                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 60.0, bottom: 10),
                            child: GestureDetector(
                              onTap: () async {
                                final selectedAvatar =
                                    await Navigator.push<String>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UserCreate(),
                                  ),
                                );

                                if (selectedAvatar != null) {
                                  await profileProvider
                                      .updateProfilePicture(context, selectedAvatar);
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/userdollar.png',
                                    width: min(screenWidth * 0.98, 600),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(avatarImagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipPath(
                                clipper: FlippedTriangleClipper(),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: const Color(0xffcb9163),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                color: const Color(0xffcb9163),
                              ),
                            ],
                          ),
                          Container(
                            height: max(600, screenHeight - 310),
                            alignment: Alignment.topCenter,
                            color: const Color(0xffcb9163),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 600,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 16),
                                          child: Text(
                                            '$username\n$realname',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 16),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                     FriendsWidget(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              '$following following \n $followers followers',
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.0, bottom: 10),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/openwallet.png',
                                        width: 400,
                                      ),
                                      Positioned(
                                        bottom: 35,
                                        left: 40,
                                        child: Text(
                                          '$streak day streak',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 40,
                                        right: 70,
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            double fontSize = min(
                                                40.0, constraints.maxWidth / 5);
                                            return Row(
                                              children: [
                                                Image.asset(
                                                  'assets/flatcoin.png',
                                                  width: 50,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  '${Provider.of<CoinProvider>(context, listen: false).coin}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: fontSize,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 0),
                                  child: const Text(
                                    'Badges',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.0, bottom: 10, right: 5, left: 5),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 500,
                                        height: 280,
                                        decoration: BoxDecoration(
                                          color: Color(0xffffccaa),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color(
                                                0xffa36737), // Change this to your desired border color
                                            width:
                                                5.0, // Change this to your desired border width
                                          ),
                                        ),
                                        child: GridView.builder(
                                          padding: EdgeInsets.all(10.0),
                                          shrinkWrap: true,
                                          itemCount: achievedBadges.length +
                                              allBadges.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 10.0,
                                          ),
                                          itemBuilder: (context, index) {
                                            if (index < achievedBadges.length) {
                                              return badgeDisplay(
                                                  achievedBadges[index]);
                                            } else {
                                              int remainingIndex =
                                                  index - achievedBadges.length;
                                              return badgeDisplay(
                                                  allBadges[remainingIndex],
                                                  opacity: 0.3);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const LogoutButton()
                    ],
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
}

class FlippedTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}