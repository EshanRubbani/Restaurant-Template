import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

class ReservationFirstDesktop extends StatelessWidget {
const ReservationFirstDesktop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Container(
      color: Color.fromRGBO(85, 83, 89, 1),
      width: width,
      height: height * 0.5,
      child: CenteredView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           NavigationBarC(number: 3,),
          Container(
            height: 162,
            width: 1140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Make a Reservation",
                  style: TextStyle(
                      fontFamily: GoogleFonts.literata().fontFamily,
                      fontSize: 86,
                      letterSpacing: -2,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      ">",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Make a Reservation",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(228, 198, 32, 1)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )));
  }
}