import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CateringsectionMobile extends StatelessWidget {
  const CateringsectionMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        // margin: EdgeInsets.only(top: 64, bottom: 64, left: 30, right: 30),
        color: Color.fromRGBO(187, 58, 18, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  width: 8,
                  height: 8,
                  color: Color.fromRGBO(228, 198, 32, 1),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "SERVICES",
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(228, 198, 32, 1),
                    decoration:
                        TextDecoration.none, // This removes the underline
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                Text("Catering Services",style: TextStyle(
                  fontFamily: GoogleFonts.literata().fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 42,
                  letterSpacing: -2,

                  color: Color.fromRGBO(255,244,226,1),
                  decoration: TextDecoration.none
                ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75  ,

                  child: Center(
                    child: Text("Bring the Mediterranean to Your Event with Our Exquisite Catering.",
                    textAlign: TextAlign.center
                    ,style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(255,244,226,1),
                      decoration: TextDecoration.none
                    
                    
                    ),),
                  ),
                )
              ]),
              SizedBox(height: 45,),
              Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                SizedBox(width: 30,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 250,
                  child: Image.asset("assets/tikka.jpg",fit: BoxFit.cover,filterQuality: FilterQuality.high,),
                ),
                Container(
                 
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 250,
                  color: Color.fromRGBO(40, 37, 46, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("For Every Occasion, Big or Small",textAlign: TextAlign.center,style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 3,
                        color: Color.fromRGBO(255, 244, 226, 1),
                        decoration: TextDecoration.none

                      ),),
                      SizedBox(height: 16,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text("Whether it's a cozy family reunion, a corporate luncheon, or a lavish wedding, let LaVie elevate your event with our Mediterranean culinary expertise."
                        ,textAlign: TextAlign.center,style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color.fromRGBO(144, 163, 177, 1),
                          decoration: TextDecoration.none
                        ),),
                      ),
                      SizedBox(height: 16,),
                      Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 1.85,
                        color: Color.fromRGBO(228, 198, 32, 1.0),
                      ),
                      backgroundColor: const Color.fromRGBO(228, 198, 32, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book Now",
                          style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.w900,
                            fontSize: 16, // Responsive font size
                            color: const Color.fromRGBO(40, 37, 46, 1),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: const Color.fromRGBO(40, 37, 46, 1),
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                    ],

                  ),
                )
              ],)
          ],
        ),
      ),
    );
  }
}
