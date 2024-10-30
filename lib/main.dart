import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_web/firebase_options.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:restro_web/views/ContactPage/contactPage.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/Homepage/widgets/CateringSection/cateringsection.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignup.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Restaurant Name',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ContactPage(),
    );
  }
}
