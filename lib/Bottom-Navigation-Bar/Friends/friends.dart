import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Friends/add_friends.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Friends/friends.model.dart';
import 'package:flutter_application_1/Providers/friend_provider.dart';

class FriendsWidget extends StatefulWidget {
  const FriendsWidget({super.key});

  @override
  State<FriendsWidget> createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> with TickerProviderStateMixin {
  late FriendsModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = FriendsModel();
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FriendProvider(context),
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFFAE4B7),
          appBar: AppBar(
            backgroundColor: const Color(0xFF8F8FE8),

            title: const Text(
              textAlign: TextAlign.center,
              'Friends',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 0,
              ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0, 0),
                        child: TabBar(
                          labelColor: Color(0xff5E17EB),
                          unselectedLabelColor: Colors.grey,
                          unselectedLabelStyle: const TextStyle(),
                          indicatorColor: Color(0xff5E17EB),
                          padding: const EdgeInsets.all(4),
                          tabs: const [
                            Tab(
                              text: 'Followers',
                            ),
                            Tab(
                              text: 'Following',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Color(0xff6363ba),
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Consumer<FriendProvider>(
                                builder: (context, friendProvider, child) {
                                  return FutureBuilder(
                                    future: friendProvider.initialization,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        return Center(child: Text('Error: ${snapshot.error}'));
                                      } 
                                      else if (friendProvider.followers.length == 0){
                                        return Center(child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text('No followers yet!\n\nGain followers by creating new friends below!', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
                                        ));
                                      }
                                      else {
                                        return ListView.builder(
                                          
                                          itemCount: friendProvider.followers.length,
                                          itemBuilder: (context, index) {
                                            final follower = friendProvider.followers[index];
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 3.0),
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF8F8FE8),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Image.asset(
                                                        follower['profilepic'],
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          follower['username'],
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        Text(
                                                          follower['fullname'],
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                              // Add similar Consumer widget for the 'Following' tab
                              Consumer<FriendProvider>(
                                builder: (context, friendProvider, child) {
                                  return FutureBuilder(
                                    future: friendProvider.initialization,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        return Center(child: Text('Error: ${snapshot.error}'));
                                      } 
                                      else if (friendProvider.following.length == 0){
                                        return Center(child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text('Not following anyone yet!\n\nClick below to add friends and follow!', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
                                        ));
                                      }
                                      
                                      else {
                                        return ListView.builder(
                                          itemCount: friendProvider.following.length,
                                          itemBuilder: (context, index) {
                                            final follower = friendProvider.following[index];
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 3.0),
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF8F8FE8),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Image.asset(
                                                        follower['profilepic'],
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          follower['username'],
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        Text(
                                                          follower['fullname'],
                                                          style: const TextStyle(
                                                            fontSize: 16,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ), 
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Color(0xff2f008d),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100),
                          child: ElevatedButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FriendSearchWidget(),
            ),
          );}, child: const Text('Add Friends')),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
