import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/friend_provider.dart';
import 'package:provider/provider.dart';

class FriendSearchWidget extends StatefulWidget {
  const FriendSearchWidget({super.key});

  @override
  State<FriendSearchWidget> createState() => _FriendSearchWidgetState();
}

class _FriendSearchWidgetState extends State<FriendSearchWidget>
    with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();
  final FocusNode _unfocusNode = FocusNode();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late FriendProvider friendProvider;
  List<Map<String, dynamic>> allItems = [];
  List<Map<String, dynamic>> items = [];
  final TextEditingController searchController = TextEditingController();

  void _showSnackBar(BuildContext context, String name) {
    final snackBar = SnackBar(
      content: Text('You are now following $name'),
      duration: const Duration(seconds: 3),
    );
    
    // Use the ScaffoldMessenger to show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  

  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        items = allItems;
      });
    } else {
      setState(() {
        items = allItems.where((e) {
          final username = e['username'].toString().toLowerCase();
          final fullname = e['fullname'].toString().toLowerCase();
          return username.contains(query.toLowerCase()) || fullname.contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  void queryListener() {
    search(searchController.text);
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(queryListener);

    // Fetching data in the initState after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      friendProvider = Provider.of<FriendProvider>(context, listen: false);
      await friendProvider.fetchUserData(context);
      setState(() {
        allItems = List.from(friendProvider.nonFriend);
        items = List.from(allItems);
      });
    });
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    _textController.dispose();
    _textFieldFocusNode.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 203, 203, 245),
        appBar: AppBar(
          backgroundColor: const Color(0xFF8F8FE8),
          title: const Text(
            'Search For Friends',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                child: TextFormField(
                  controller: searchController,
                  focusNode: _textFieldFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: false,
                    labelText: 'Search for friends...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 179, 179, 252),
                        )),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 179, 179, 233),
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                    ),
                  ),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: null,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                      child: Text('Friends matching search'),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 12, 16, 0),
                      child: Text("${items.length}"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: Consumer<FriendProvider>(
                      builder: (context, friendProvider, child) {
                    return FutureBuilder(
                        future: friendProvider.initialization,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else {
                            return ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final notFollow = items[index];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        width: 100,
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 205, 205, 248),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0xff5e17eb),
                                              offset: Offset(0.0, 1),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(40),
                                                child: Image.asset(
                                                  notFollow["profilepic"],
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: Text(
                                                        "${notFollow["fullname"]}",
                                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                            child: Text("${notFollow["username"]} |"),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                            child: Text(
                                                              '${notFollow["followerNum"]} followers',
                                                              style: const TextStyle(color: Color(0xff5e17eb)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Card(
                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                color: const Color.fromARGB(255, 221, 221, 221),
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(40),
                                                ),
                                               child: Padding(
                                                  padding: const EdgeInsets.all(4),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      final String? userId = notFollow["_id"];
                                                      if (userId != null) {
                                                        Provider.of<FriendProvider>(context, listen: false).updateOtherPerson(context,userId);
                                                        Provider.of<FriendProvider>(context, listen: false).updateFollowing(context,userId);
                                                        _showSnackBar(context, notFollow["username"]);
                                                        items.remove(items[index]);
                                                        allItems.remove(items[index]);
                                                          Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => widget));
                                                      } else {
                                                        print("Error: userId is null");
                                                      }
                                                    },
                                                    child: const Icon(
                                                      Icons.person_add,
                                                      color: Color(0xff5e17eb),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),

                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                        });
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
