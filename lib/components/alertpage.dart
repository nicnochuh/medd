import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med/pages/user.dart';

class AlertPage extends StatelessWidget {
  // Predefined phone numb

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset(
                'lib/icons/emergency.png',
                height: 50,
              ),
            ),
          ),
          Text("ALERT SEND TO ",
              style: GoogleFonts.bebasNeue(
                  textStyle: const TextStyle(fontSize: 50, color: Colors.red))),
          Text(
            Users.number,
          ),
        ],
      ),
    );
  }
}
