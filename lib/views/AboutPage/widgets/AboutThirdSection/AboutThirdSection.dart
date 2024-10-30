import 'package:flutter/material.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutThirdSection/AboutThirdDesktop.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutThirdSection/AboutThirdMobile.dart';

class AboutThirdSection extends StatelessWidget {
const AboutThirdSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return AboutThirdDesktop();
        } else {
          return AboutThirdMobile();
        }
      },
    );
  }
}