import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med/auth/authent.dart';


class intro extends StatelessWidget {
  const intro({super.key});

  //show loading circle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.medication_rounded,
              color: Colors.grey[700],
              size: 80,
            ),

            //title
            const SizedBox(height: 10),
            Text('MEDTRACK',
                style:
                    GoogleFonts.bebasNeue(textStyle: const TextStyle(fontSize: 50))),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                child: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const authpage(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  icons(Icon icon) {}
}
