import 'package:flutter/material.dart';

class BadgePopup extends StatelessWidget {
  final String badgeImagePath;
  final VoidCallback onClose;

  BadgePopup({required this.badgeImagePath, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff8483e4),
      contentPadding: EdgeInsets.zero,
      content: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Image.asset(badgeImagePath, width: 150,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Congrats, you earned a badge!', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onClose,
            ),
          ),
        ],
      ),
    );
  }
}
