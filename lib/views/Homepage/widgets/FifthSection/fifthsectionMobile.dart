import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FifthsectionMobile extends StatelessWidget {
  const FifthsectionMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(40, 37, 46, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                "BLOG",
                style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(228, 198, 32, 1)),
              ),
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 950) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Latest News",
                      style: TextStyle(
                          fontFamily: GoogleFonts.literata().fontFamily,
                          fontSize: 52,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 244, 226, 1)),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      width: 403,
                      height: 48,
                      child: Text(
                        "Sed nulla sed purus vitasse. urna est iverra sed etiam quisque. Nisl in pulvinar ultrices tempusut dui",
                        style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(144, 163, 177, 1)),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View All',
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Latest News",
                      style: TextStyle(
                          fontFamily: GoogleFonts.literata().fontFamily,
                          fontSize: 52,
                          letterSpacing: -2,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 244, 226, 1)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 403,
                      height: 48,
                      child: Text(
                        "Sed nulla sed purus vitasse. urna est iverra sed etiam quisque. Nisl in pulvinar ultrices tempusut dui",
                        style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(144, 163, 177, 1)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View All',
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          SizedBox(
            height: 64,
          ),
          Container(
            width: 1140,
            height: 350,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 850
                    ? 2
                    : 1, // Number of columns
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  height: 302,
                  width: 360,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 360,
                        height: 230,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Super Easy Baked Feta Pasta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color.fromRGBO(255, 244, 226, 1),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'July 18, 2022 No Comments',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromRGBO(144, 163, 177, 1),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
