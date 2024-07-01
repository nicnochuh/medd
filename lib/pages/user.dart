import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med/components/userdetails.dart';

class Users extends StatefulWidget {
  static String number = 'emer';

  const Users({super.key});

  @override
  State<Users> createState() => _UserState();
}

class _UserState extends State<Users> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  //all user
  final usersCollection = FirebaseFirestore.instance.collection("users");

  //edit field
  Future<void> editfield(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: TextStyle(color: Colors.grey[300]),
        ),
        content: TextField(
            autofocus: true,
            style: TextStyle(color: Colors.grey[300]),
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey[300]),
            ),
            onChanged: (value) {
              newValue = value;
            }),
        actions: [
          //cancel button
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          //save button
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );
//update in firestore
    if (newValue.trim().isNotEmpty) {
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            'PROFILE',
            style: GoogleFonts.bebasNeue(
                textStyle: TextStyle(color: Colors.grey[300], fontSize: 40)),
          ),
        ),
      ),

      //user || if (snapshot.hasData && snapshot.data.exists) {  Map<String, dynamic> documentFields = snapshot.data!.data() as Map<String, dynamic>; ||

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          //get user data
          if (snapshot.hasData) {
            final userdata = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                    ]),

                //profile icon
                const Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Divider(
                    color: Colors.grey[600],
                    thickness: 1,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                //userdetails
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('user details',
                      style: TextStyle(color: Colors.grey[400], fontSize: 15)),
                ),

                //username
                Userbox(
                  text: userdata['username'],
                  sectionName: 'username',
                  onpressed: () => editfield('username'),
                ),

                //bio

                Userbox(
                  text: userdata['bio'],
                  sectionName: 'age',
                  onpressed: () => editfield('bio'),
                ),
                //phone number
                Userbox(
                  text: userdata['num'],
                  sectionName: 'phone',
                  onpressed: () => editfield('num'),
                ),

                //address

                Userbox(
                  text: userdata['add'],
                  sectionName: 'address',
                  onpressed: () => editfield('add'),
                ),

                //user medication details
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'medication details',
                    style: TextStyle(color: Colors.grey[400], fontSize: 15),
                  ),
                ),
                //blood type

                Userbox(
                  text: userdata['blood'],
                  sectionName: 'blood type',
                  onpressed: () => editfield('blood'),
                ),
                //emergency phone number
                Userbox(
                  text: userdata['emer'],
                  sectionName: 'emergency number',
                  onpressed: () => editfield('emer'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
