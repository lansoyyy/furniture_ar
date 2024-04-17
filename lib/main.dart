import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/new.dart';
import 'package:furniture_app/new_ar_view.dart';
import 'package:furniture_app/screens/auth/pages/login_page.dart';
import 'package:furniture_app/screens/auth/pages/register_page.dart';
import 'package:furniture_app/screens/auth/values/app_constants.dart';
import 'package:furniture_app/screens/auth/values/app_routes.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:furniture_app/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'furniture-app-54ad7',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FixTure',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Here we set DM Sans as our default fonts
        // Now we also apply out text color to all flutter textTheme
        textTheme:
            GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
        // Almost all of our app bar have this style
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: AppConstants.navigationKey,
      routes: {
        AppRoutes.loginScreen: (context) => const LoginPage(),
        AppRoutes.registerScreen: (context) => const RegisterPage(),
      },
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return HelloWorld1();
            }
          }),
    );
  }
}
