import 'package:flutter/material.dart';
import 'package:med/components/notification_Widget.dart';

class Localnotifications extends StatefulWidget {
  const Localnotifications({super.key});

  @override
  State<Localnotifications> createState() => _LocalnotificationsState();
}

class _LocalnotificationsState extends State<Localnotifications> {
  @override
  void initState() {
    super.initState();
    NotificationWidget.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              alignment: Alignment.topCenter,
              child: Text(
                "set Reminder",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
