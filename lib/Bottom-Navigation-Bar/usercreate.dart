import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/profile_provider.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/bottombar.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/profile.dart';
import 'package:provider/provider.dart';

class UserCreate extends StatefulWidget {
  const UserCreate({Key? key}) : super(key: key);

  @override
  _UserCreateState createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  String largeImagePath = 'assets/defaultguy.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(largeImagePath),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildSmallImage('assets/buzman.png'),
                buildSmallImage('assets/ogwawa.png'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildSmallImage('assets/defaultwoman.png'),
                buildSmallImage('assets/defaultguy.png'),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (!(Provider.of<ProfileProvider>(context, listen: false)
                        .badges
                        .contains("assets/Badges/pretty.png"))) {
                      await Provider.of<ProfileProvider>(context, listen: false)
                          .updateUserBadge(context, "pretty");
                    }
                    Navigator.pop(context, largeImagePath);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 120, 112, 222),
                    ),
                  ),
                  child: Text(
                    'Save!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(initialIndex: 3),
    );
  }

  Widget buildSmallImage(String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          largeImagePath = imagePath;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
