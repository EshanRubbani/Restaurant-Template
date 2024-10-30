import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutThirdDesktop extends StatelessWidget {
const AboutThirdDesktop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(40, 37, 47, 1),
      child: Container(
        height: 555,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 555,
              width: 555,
              color: Color.fromRGBO(189, 189, 189, 1),
                        child: Image.asset("assets/shop (2).png",fit: BoxFit.cover,),

            ),
            SizedBox(
              width: 64,
            ),
            Container(
              width: 585,
              padding: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        color: const Color.fromRGBO(228, 198, 32, 1),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'HISTORY',
                        style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Color.fromRGBO(228, 198, 32, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 521,
                    height: 72,
                    child: Text(
                      "Philosophy",
                      style: TextStyle(
                          fontFamily: GoogleFonts.literata().fontFamily,
                          fontSize: 52,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 244, 226, 1)),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 521,
                  
                    child: Text(
                      "We believe in the power of food to nourish both body and soul, bringing people together in celebration of life's simple pleasures.",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromRGBO(144, 163, 177, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 521,
                   
                    child: Text(
                      "Our commitment to authenticity and excellence drives us to craft each dish with passion, honoring Mediterranean culinary heritage while embracing local influences.",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromRGBO(144, 163, 177, 1)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}