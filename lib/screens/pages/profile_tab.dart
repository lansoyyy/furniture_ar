import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:furniture_app/widgets/text_widget.dart';

import 'dart:io';

import '../../widgets/drawer_widget.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text('Profile'),
        ),
        body: StreamBuilder<DocumentSnapshot>(
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
              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              minRadius: 75,
                              maxRadius: 75,
                              backgroundImage:
                                  NetworkImage(data['profilePicture']),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextBold(
                            text: '${data['name']}',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          TextRegular(
                            text: data['email'],
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
            }),
      ),
    );
  }
}
