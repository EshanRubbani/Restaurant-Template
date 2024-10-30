import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutfifthMobile extends StatelessWidget {
  const AboutfifthMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(40, 37, 46, 1),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Stack(
  alignment: Alignment.center,
  children: [
    Container(
      margin: EdgeInsets.only(top: 100),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(

          options: MapOptions(
            backgroundColor: Colors.black,
                      initialCenter: LatLng(
                          41.6215, -83.7083), // Coordinates for the address
                      initialZoom: 15.0,
                    ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
              subdomains: ['a', 'b', 'c'],
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(41.6215, -83.7083), // Coordinates for the pin
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    Positioned(
      top: 100,
      left: 80,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  "VISIT US",
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 14,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(228, 198, 32, 1)),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 72,
              child: Text(
                "Visit Our Restaurant",
                style: TextStyle(
                    fontFamily: GoogleFonts.literata().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    letterSpacing: -2,
                    color: Color.fromRGBO(255, 244, 226, 1)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                "Explore our full menu, make reservations, and discover the LaVie experience.",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 244, 226, 1)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      "Your Restaurant Address",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Phone",
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 244, 226, 1)),
                  ),
                  Text(
                    "Your Restaurant Address",
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 244, 226, 1)),
                  ),
                  Text(
                    "Your Restaurant Mail",
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () async {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(228, 198, 32, 1),
                elevation: 0,
              ),
              child: Text(
                'Get Directions',
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
      ),
    )
  ],
)
      ),
    );
  }
}
