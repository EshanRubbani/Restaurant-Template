import 'package:flutter/material.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationSection/reservationSectionDesktop.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationSection/reservationSectionMobile.dart';
class ReservationSection extends StatelessWidget {
const ReservationSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          return ReservationSectionDesktop();
        } else {
          return ReservationSectionMobile();
        }
      },
    );
  }
}