import 'package:flutter/material.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFifthSection/aboutfifthsection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFirstSection/aboutfirstsection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutFourthSection/aboutfourthsection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutSecondSection/aboutSecondSection.dart';
import 'package:restro_web/views/AboutPage/widgets/AboutThirdSection/AboutThirdSection.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';

class AboutpageDesktop extends StatefulWidget {
  const AboutpageDesktop({ Key? key }) : super(key: key);

  @override
  _AboutpageDesktopState createState() => _AboutpageDesktopState();
}

class _AboutpageDesktopState extends State<AboutpageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
         Aboutfirstsection(),
        Aboutsecondsection(),
        AboutThirdSection(),
         Aboutfourthsection(),
         Aboutfifthsection(),
          CarasoulSlider(),
          footer()
        ],
      )),
    );
  }
}