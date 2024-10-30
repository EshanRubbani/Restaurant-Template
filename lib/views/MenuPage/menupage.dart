import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthSection.dart';
import 'package:restro_web/views/MenuPage/menuDesktop.dart';
import 'package:restro_web/views/MenuPage/menuMobile.dart';
import 'package:restro_web/views/MenuPage/widgets/MenuFirstSectionM/MenuFirstSectionM.dart';
import 'package:restro_web/views/MenuPage/widgets/discoverourmenu/discoverourmenu.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return MenuDesktop();
        } else {
          return MenuMobile();
        }
      },
    );
  }
}
