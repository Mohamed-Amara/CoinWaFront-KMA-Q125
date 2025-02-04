import 'package:flutter/material.dart';
import 'package:flutter_application_1/lobby.dart';

class ExitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 16,
      child: IconButton(
        icon:
            Icon(Icons.close, color: Color.fromARGB(255, 83, 83, 83), size: 30),
        onPressed: () {
          // Navigate to the lobby page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LobbyApp(),
            ),
          );
        },
      ),
    );
  }
}

Widget TapToContinue(){
  return const Positioned(
    bottom: 15,
    right: 15,
    child: Text("Tap to continue ...", style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18
    ),),
  );
}