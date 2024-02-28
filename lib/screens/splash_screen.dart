import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_app/screens/auth/pages/login_page.dart';
import 'package:furniture_app/widgets/text_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //code para mawala to ang debug nga pula sa top right sa app screen
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ani.gif',
              height: 500,
            ),
            SizedBox(
              height: 50,
            ),
            TextBold(text: 'FixTure', fontSize: 48, color: Colors.amber),
            SizedBox(
              height: 50,
            ),
          ],
        )),
      ),
    );
  }
}
