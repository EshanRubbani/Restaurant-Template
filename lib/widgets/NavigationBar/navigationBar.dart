import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:restro_web/views/ContactPage/contactPage.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignup.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignupMobile.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';
import 'package:restro_web/widgets/NavigationBar/navbar_desktop.dart';
import 'package:restro_web/widgets/NavigationBar/navbar_mobile.dart';

class NavigationBarC extends StatefulWidget {
  final int number;

  const NavigationBarC({Key? key, required this.number}) : super(key: key);

  @override
  State<NavigationBarC> createState() => _NavigationBarCState();
}

class _NavigationBarCState extends State<NavigationBarC> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 650) {
          return NavbarDesktop(number: widget.number);
        } else {
          return NavbarMobile(number: widget.number);
        }
      },
    );
  }




}

