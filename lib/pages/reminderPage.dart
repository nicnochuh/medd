import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med/components/remindertile.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  //timeofday variable
  final mednamecontroller = TextEditingController();

  TimeOfDay _timeOfDay = TimeOfDay.now();
  //padding controllers
  final double horizontalpadding = 25;

  final double verticalpadding = 10;

  //time picker
  void showtimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        {
          _timeOfDay = value!;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: Text(
              'REMINDERS',
              style: GoogleFonts.bebasNeue(
                textStyle: TextStyle(fontSize: 55, color: Colors.grey[800]),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Reminderfield(
                controller: mednamecontroller,
                hintText: 'enter med name',
                obscureText: false,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  _timeOfDay.format(context).toString(),
                  style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
                child: MaterialButton(
                  onPressed: showtimePicker,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.grey[200],
                  elevation: 5,
                  focusColor: Colors.grey[900],
                  child: Text(
                    'PICK TIME',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 150, top: 10),
            child: Divider(
              color: Colors.grey[400],
              thickness: 0.8,
            ),
          ),
        ]));
  }
}
