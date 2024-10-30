import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

class MenuFirstSectionMMobile extends StatelessWidget {
  const MenuFirstSectionMMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        color: Color.fromRGBO(85, 83, 89, 1),
        width: width,
        height: height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
            Container(
             
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Our Menus",
                        style: TextStyle(
                            fontFamily: GoogleFonts.literata().fontFamily,
                            fontSize: 36,
                            letterSpacing: -2,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1)
                            // color: Colors.red
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
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
                            "Our Menus",
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(228, 198, 32, 1)),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
