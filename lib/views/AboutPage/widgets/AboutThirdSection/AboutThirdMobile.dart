import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutThirdMobile extends StatelessWidget {
  const AboutThirdMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(40, 37, 47, 1),
      child: Stack(
        alignment: Alignment.center,
        children: [
         Container(
  height: MediaQuery.of(context).size.height * 0.8,
  width: MediaQuery.of(context).size.width * 0.8,
  decoration: BoxDecoration(
    // Use BoxDecoration for the background
    image: DecorationImage(
      image: AssetImage("assets/shop (2).jpg"),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.4), // Apply opacity to the image
        BlendMode.dstATop,
      ),
    ),
  ),
  child: Container(
    decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [
          Colors.transparent, // Transparent center
          Colors.black.withOpacity(0.6), // Darker at edges
        ],
        center: Alignment.center,
        radius: 0.6, // Adjust for vignette effect size
      ),
    ),
  ),
),

          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        'Restaurant’s',
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
                    // height: 144,
                    child: Text(
                      "We believe in the power of food to nourish both body and soul, bringing people together in celebration of life's simple pleasures.",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 521,
                    // height: 144,
                    child: Text(
                      "Our commitment to authenticity and excellence drives us to craft each dish with passion, honoring Mediterranean culinary heritage while embracing local influences.",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      // child:
    );
  }
}
