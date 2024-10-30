import 'package:flutter/material.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactFirstSection/contactfirstSection.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactSecondSection/contactSecondSection.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
class ContactDesktop extends StatefulWidget {
  const ContactDesktop({ Key? key }) : super(key: key);

  @override
  _ContactDesktopState createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
         ContactfirstSection(),
         ContactsecondSection(),
            CarasoulSlider(),
        footer()
        ],
      )),
    );
  }
}