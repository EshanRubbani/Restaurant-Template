import 'package:flutter/material.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFourthSection/aboutfourthDesktop.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFourthSection/aboutfourthMobile.dart';

class Aboutfourthsection extends StatelessWidget {
const Aboutfourthsection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return AboutfourthDesktop();
        } else {
          return AboutfourthMobile();
        }
      },
    );
  }
}