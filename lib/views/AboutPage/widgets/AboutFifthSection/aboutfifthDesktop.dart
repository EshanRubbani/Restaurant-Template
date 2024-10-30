import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutfifthDesktop extends StatelessWidget {
  const AboutfifthDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color.fromRGBO(40, 37, 46, 1),
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Side with Address and Button
              Container(
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
                          color: const Color.fromRGBO(228, 198, 32, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "VISIT US",
                          style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 14,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(228, 198, 32, 1)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 72,
                      child: Text(
                        "Visit Our Restaurant",
                        style: TextStyle(
                          fontFamily: GoogleFonts.literata().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 52,
                          letterSpacing: -2,
                          color: const Color.fromRGBO(255, 244, 226, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      width: 589,
                      height: 48,
                      child: Text(
                        "Explore our full menu, make reservations, and discover the LaVie experience.",
                        style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color.fromRGBO(144, 163, 177, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      height: 170,
                      width: 590,
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
                              color: const Color.fromRGBO(255, 244, 226, 1),
                            ),
                          ),
                          Text(
                            "Your Restaurant Address",
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(144, 163, 177, 1),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Phone",
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 244, 226, 1)),
                          ),
                          Text(
                            "Your Restaurant Phone No",
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(144, 163, 177, 1)),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 244, 226, 1)),
                          ),
                          Text(
                            "Your Restaurant Mail",
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(144, 163, 177, 1)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                     onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(228, 198, 32, 1),
                        elevation: 0,
                      ),
                      child: Text(
                        'Get Directions',
                        style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color.fromRGBO(40, 37, 46, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                  width: 32), // Add some space between the text and map

              // Right Side with OpenStreetMap
              Container(
                height: 555,
                width: 487,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(
                          41.6215, -83.7083), // Coordinates for the address
                      initialZoom: 15.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(
                                41.6215, -83.7083), // Coordinates for the pin
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
            ],
          ),
        ),
      ),
    );
  }
}
