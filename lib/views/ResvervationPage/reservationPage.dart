import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationFirst/reservationFirst.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationSection/reservationSection.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationSection/reservationSectionMobile.dart';
import 'package:restro_web/views/ResvervationPage/reservationDesktop.dart';
import 'package:restro_web/views/ResvervationPage/reservationPageMobile.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return ReservationDesktop();
        } else {
          return ReservationPageMobile();
        }
      },
    );
  }

}