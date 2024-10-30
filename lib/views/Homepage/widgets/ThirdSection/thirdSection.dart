import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section_mobile.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_desktop.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section_mobile.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdsectionDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdsectionMobile.dart';
// Import your CenteredView file

class ThirdSection extends StatelessWidget {
    final ScrollController scrollController;  // Add this
    ThirdSection({required this.scrollController});  // Modify the constructor
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return ThirdsectionDesktop();
        } else {
          return ThirdsectionMobile(scrollController: scrollController);
        }
      },
    );
  }
}
