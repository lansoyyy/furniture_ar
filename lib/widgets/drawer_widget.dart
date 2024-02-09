import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth/pages/login_page.dart';
import 'package:furniture_app/screens/pages/aboutus_page.dart';
import 'package:furniture_app/screens/pages/contactus_page.dart';
import 'package:furniture_app/screens/pages/profile_tab.dart';
import 'package:furniture_app/widgets/text_widget.dart';

import '../screens/home/home_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          dynamic data = snapshot.data;
          return SizedBox(
            width: 220,
            child: Drawer(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(),
                    accountEmail: TextRegular(
                        text: data['email'], fontSize: 12, color: Colors.grey),
                    accountName: TextBold(
                      text: data['name'],
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    currentAccountPicture: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 75,
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'Home',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'Profile',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ProfileTab()));
                    },
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'Contact Us',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ContactusPage()));
                    },
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'About Us',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const AboutusPage()));
                    },
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'About App',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      showAboutDialog(
                          context: context,
                          applicationName: 'FixTure',
                          applicationIcon: const Icon(
                            Icons.crop,
                          ),
                          applicationVersion: 'v1.0.0');
                    },
                  ),
                  ListTile(
                    title: TextBold(
                      text: 'Logout',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                  'Logout Confirmation',
                                  style: TextStyle(
                                      fontFamily: 'QBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  'Are you sure you want to Logout?',
                                  style: TextStyle(fontFamily: 'QRegular'),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text(
                                      'Close',
                                      style: TextStyle(
                                          fontFamily: 'QRegular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                          fontFamily: 'QRegular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
