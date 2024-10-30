import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_mobile.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footerDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footerMobile.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footerSmall.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthsectionDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthsectionMobile.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_mobile.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdsectionDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdsectionMobile.dart';
import 'package:restro_web/views/MenuPage/widgets/MenuFirstSectionM/MenuFirstSectionMDesktop.dart';
import 'package:restro_web/views/MenuPage/widgets/MenuFirstSectionM/MenuFirstSectionMMobile.dart';
import 'package:restro_web/views/MenuPage/widgets/discoverourmenu/discoverourmenuDesktop.dart';
import 'package:restro_web/views/MenuPage/widgets/discoverourmenu/discoverourmenuMobile.dart';
// Import your CenteredView file

class MenuFirstSectionM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 650) {
          return MenuFirstSectionMDesktop();
        } else {
          return MenuFirstSectionMMobile();
        }
      },
    );
  }
}
