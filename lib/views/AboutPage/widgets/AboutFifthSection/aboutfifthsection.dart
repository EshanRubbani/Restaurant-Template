import 'package:flutter/material.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFifthSection/aboutfifthDesktop.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFifthSection/aboutfifthMobile.dart';

class Aboutfifthsection extends StatelessWidget {
const Aboutfifthsection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return AboutfifthDesktop();
        } else {
          return AboutfifthMobile();
        }
      },
    );
  }
}