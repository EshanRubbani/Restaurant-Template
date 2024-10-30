import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/views/Homepage/homepageDesktop.dart';
import 'package:restro_web/views/Homepage/homepageMobile.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/FifthSection/fifthSection.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthSection.dart';
import 'package:restro_web/views/Homepage/widgets/SecondCarasoul/secondCarasoul.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdSection.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return HomepageDesktop();
        } else {
          return HomepageMobile();
        }
      },
    );
  }
}