import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';

class AboutSecondDesktop extends StatelessWidget {
const AboutSecondDesktop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/pngs/aboutbg.png",fit: BoxFit.cover,)),
          CenteredView(
            child: Container(
              // color: Colors.black.withOpacity(0.5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 * 0.42,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Stack(
                  children: [
                    // Background boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 500,
                          height: 470,
                          color: const Color.fromRGBO(189, 189, 189, 1.0),
                        child: Image.asset("assets/shop (8).png",fit: BoxFit.cover,),

                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 450,
                          height: 560,
                          color: const Color.fromRGBO(189, 189, 189, 1.0),
                        child: Image.asset("assets/shop (10).png",fit: BoxFit.cover,),

                        ),
                      ],
                    ),
                    // "About Us" Container stacked over the background boxes
                    Positioned(
                      left: 150,
                      top: 150,
                      child: Container(
                        padding: const EdgeInsets.only(top: 38, left: 48),
                        width: 430,
                        color: const Color(0xFFF7F0D9), // Light cream color

                        height: 380,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  color: const Color.fromRGBO(144, 163, 177, 1),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'ABOUT',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'About Us',
                              style: TextStyle(
                                fontFamily: GoogleFonts.literata().fontFamily,
                                color: const Color.fromRGBO(
                                    228, 198, 32, 1), // Yellow color
                                fontSize: 52,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              // color: Colors.black.withOpacity(0.5),
                              width: 350,
                              height: 170,
                              child: Text(
                                'At (Your Restaurant Name), we blend time-honored culinary traditions with locally-sourced ingredients to bring the vibrant flavors and warm hospitality of the Mediterranean to Toledo, creating a dining experience that transports you to sun-drenched coastal villages with every bite.',
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.inter().fontFamily,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
