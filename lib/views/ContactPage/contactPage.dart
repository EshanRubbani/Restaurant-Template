import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactFirstSection/contactfirstSection.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactSecondSection/contactSecondSection.dart';
import 'package:restro_web/views/ContactPage/contactDesktop.dart';
import 'package:restro_web/views/ContactPage/contactMobile.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
 double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return ContactDesktop();
        } else {
          return ContactMobilePage();
        }
      },
    );

    // return Scaffold(
    //   body: SingleChildScrollView(
    //       child: Column(
    //     children: [
    //      ContactfirstSection(),
    //      ContactsecondSection(),
    //         CarasoulSlider(),
    //     footer()
    //     ],
    //   )),
    // );
  }

}


