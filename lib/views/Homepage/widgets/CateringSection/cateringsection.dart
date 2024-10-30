import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/Homepage/widgets/CateringSection/cateringsectionDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/CateringSection/cateringsectionMobile.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_mobile.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthsectionDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthsectionMobile.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_mobile.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdsectionDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdsectionMobile.dart';
// Import your CenteredView file

class CateringSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return CateringsectionDesktop();
        } else {
          return CateringsectionMobile();
        }
      },
    );
  }
}
