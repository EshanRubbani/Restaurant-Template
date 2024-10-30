import 'package:flutter/material.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactFirstSection/contactFirstSectionDesktop.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactFirstSection/contactFirstSectionMobile.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactSecondSection/contactsecondDesktop.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactSecondSection/contactsecondMobile.dart';


class ContactsecondSection extends StatelessWidget {
const ContactsecondSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return ContactsecondDesktop();
        } else {
          return ContactsecondMobile();
        }
      },
    );
  }
}