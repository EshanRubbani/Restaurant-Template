import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSmall extends StatelessWidget {
  const FooterSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> schedule = [
      {'day': 'Monday', 'hours': '10 AM - 11 PM'},
      {'day': 'Tuesday', 'hours': '10 AM - 11 PM'},
      {'day': 'Wednesday', 'hours': '10 AM - 11 PM'},
      {'day': 'Thursday', 'hours': '10 AM - 11 PM'},
      {'day': 'Friday', 'hours': '10 AM - 11 PM'},
      {'day': 'Saturday', 'hours': '10 AM - 11 PM'},
      {'day': 'Sunday', 'hours': '10 AM - 11 PM'},
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(40, 37, 46, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 235,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Know About (Your Restaurant Name)",
                            style: TextStyle(
                                fontFamily: GoogleFonts.literata().fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(228, 198, 32, 1)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Discover the Story Behind Our Mediterranean Cuisine.",
                            style: TextStyle(
                                fontFamily: GoogleFonts.literata().fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(144, 163, 177, 1)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //  Text(
                          //     "Lavie Restaurant",
                          //     style: TextStyle(
                          //       fontFamily: GoogleFonts.lato().fontFamily,
                          //       fontWeight: FontWeight.w800,
                          //       fontSize:24,
                                    
                          //       color: const Color.fromRGBO(228, 198, 32, 1),
                          //       letterSpacing: 1.2,
                          //     ),
                          //   ),
                            SizedBox(
                            height: 16,
                          ),
                          Container(
                              height: 150,
                              width: 300,
                              child: Image.asset("assets/lavieLogo.jpg"))
                        ],
                      ),
                    ),
                   
                    Container(
                      width: 235,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "Opening Hours",
                            style: TextStyle(
                                fontFamily: GoogleFonts.literata().fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(228, 198, 32, 1)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            " See our detailed hours below for your convenience.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(144, 163, 177, 1)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 272,
                            width: 254,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: schedule.length,
                              itemBuilder: (context, index) {
                                final day = schedule[index]['day'];
                                final hours = schedule[index]['hours'];

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        day!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        hours!,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(144, 163, 177, 1),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 235,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Contact",
                            style: TextStyle(
                                fontFamily: GoogleFonts.literata().fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(228, 198, 32, 1)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 221,
                            height: 227,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(255, 244, 226, 1)),
                                ),
                                Text(
                                  "Your Restaurant Address",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(144, 163, 177, 1)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Phone",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(255, 244, 226, 1)),
                                ),
                                Text(
                                  "Your Restaurant Phone No",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(144, 163, 177, 1)),
                                ),
                                SizedBox(height: 10,),
                                 Text(
                                  "Your Restaurant Phone No",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(144, 163, 177, 1)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(255, 244, 226, 1)),
                                ),
                                Text(
                                  "Your Restaurant Mail",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(144, 163, 177, 1)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: 176,
                            height: 32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  
                                  child:
                                      Image.asset("assets/pngs/facebook.png"),
                                ),
                                InkWell(
                                                                    child: Image.asset("assets/pngs/twitter.png"),
                                ),
                                InkWell(
                                  
                                  child:
                                      Image.asset("assets/pngs/instagram.png"),
                                ),
                                InkWell(
                                 
                                  child: Image.asset("assets/pngs/youtube.png"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Newsletter",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.literata().fontFamily,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(228, 198, 32, 1)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Subscribe our newsletter & get all promo!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(144, 163, 177, 1)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 250,
                            height: 48,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: "Email address",
                                  labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(144, 163, 177, 1))),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(228, 198, 32, 1),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Subscribe',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color.fromRGBO(40, 37, 46, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
