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

class _LeaderboardWidgetState extends State<LeaderboardWidget>
    with TickerProviderStateMixin {
  late TabController _tabBarController;
  late Future<void> _futureFetch;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() {
        setState(() {
          _futureFetch = context
              .read<LeaderProvider>()
              .fetchUserData(context, _tabBarController.index == 0);
        });
      });

    _futureFetch = context.read<LeaderProvider>().fetchUserData(context, true);

    // Fetch data in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().fetchUserData(context);
      context.read<CoinProvider>().fetchUserData(context);
    });
  }

  @override
  void dispose() {
    _tabBarController.dispose();
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
      appBar: AppBar(
        backgroundColor: const Color(0xff7870de),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Leaderboard',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Align(
              alignment: const Alignment(0, 0),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: const Color(0xff57636C),
                indicatorColor: const Color(0xff4B39EF),
                padding: const EdgeInsets.all(4),
                tabs: const [
                  Tab(text: 'Global'),
                  Tab(text: 'Friends'),
                ],
                controller: _tabBarController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabBarController,
                children: [
                  _buildTabView(true),
                  _buildTabView(false),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Consumer<ProfileProvider>(
                builder: (context, profileProvider, child) {
                  if (profileProvider.username.isEmpty ||
                      profileProvider.profilepic.isEmpty) {
                    return const CircularProgressIndicator();
                  }
                  return Container(
                    color: _tabBarController.index == 0
                        ? const Color.fromARGB(255, 168, 160, 243)
                        : const Color.fromARGB(255, 159, 198, 255),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '#${context.watch<LeaderProvider>().position}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Image.asset(profileProvider.profilepic, width: 80),
                          const SizedBox(width: 20),
                          Column(
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Text(
                            context.watch<CoinProvider>().coin.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Image.asset('assets/flatcoin.png', width: 60),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(initialIndex: 2),
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
                              alignment: AlignmentDirectional(0, -3),
                              children: [
                                Container(
                                  width: 120,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffC0C0C0),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, -1),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF9E9E9E),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: (leaderProvider.username.length < 2)
                                            ? Text(""):Image.asset(
                                        leaderProvider.pfp[1],
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  child: Column(
                                    children: [
                                      Text(
                                        (leaderProvider.username.length < 2)
                                            ? ""
                                            : leaderProvider.username[1],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        (leaderProvider.username.length < 2)
                                            ? ""
                                            : '${leaderProvider.followers[1]} followers',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        (leaderProvider.username.length < 2)
                                            ? ""
                                            : leaderProvider.coins[1].toString(),
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
