import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulsliderDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulsliderMobile.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_mobile.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_mobile.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignupDesktop.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignupMobile.dart';
// Import your CenteredView file

class LoginSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return LoginSignupDesktop();
        } else {
          return LoginSignupMobile();
        }
      },
    );
  }
}
