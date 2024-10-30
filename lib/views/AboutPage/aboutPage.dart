import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/AboutPage/aboutpageMobile.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFifthSection/aboutfifthsection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFirstSection/aboutfirstsection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFourthSection/aboutfourthsection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutSecondSection/aboutSecondSection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutThirdSection/AboutThirdDesktop.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutThirdSection/AboutThirdSection.dart';
import 'package:restro_web/views/AboutPage/widgets/aboutpageDesktop.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return AboutpageDesktop();
        } else {
          return AboutpageMobile();
        }
      },
    );

    // return Scaffold(
    //   body: SingleChildScrollView(
    //       child: Column(
    //     children: [
    //      Aboutfirstsection(),
    //     Aboutsecondsection(),
    //     AboutThirdSection(),
    //      Aboutfourthsection(),
    //      Aboutfifthsection(),
    //       CarasoulSlider(),
    //       footer()
    //     ],
    //   )),
    // );
  }



   
}

