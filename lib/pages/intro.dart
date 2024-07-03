import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med/auth/authent.dart';

class intro extends StatefulWidget {
  const intro({super.key});

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  //show loading circle
  void reminderbox() async {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(
        builder: (context) => authpage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: GestureDetector(
          onTap: reminderbox,
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //logo
              Icon(
                Icons.medication_rounded,
                color: Colors.grey[700],
                size: 80,
              ),

              //title
              const SizedBox(height: 10),
              Text('MEDTRACK',
                  style: GoogleFonts.bebasNeue(
                      textStyle: const TextStyle(fontSize: 50))),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ));
  }

  icons(Icon icon) {}
}
