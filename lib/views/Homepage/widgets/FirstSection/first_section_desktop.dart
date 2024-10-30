import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/GLobals/constants.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert'; // For encoding and decoding JSON

class FirstSectionDesktop extends StatelessWidget {
  final double width;
  final double height;

  FirstSectionDesktop({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Background SVG
          Positioned.fill(child: Image.asset('assets/bg1.png',
          fit: BoxFit.cover,
          )),
          // Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               NavigationBarC(number: 0,),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: AppStyles.getItemSpacing(width)),
                        width: AppStyles.getResponsiveWidth(width, 0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AUTHENTIC MEDITERRANEAN \nCUISINE",
                              style: TextStyle(
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    AppStyles.getDynamicFontSize(width * 1.1),
                                color: const Color.fromRGBO(228, 198, 32, 1),
                                letterSpacing: 1.2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: AppStyles.getItemSpacing(width)),
                              child: Text(
                                "Your Restaurant Name",
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                  fontWeight: FontWeight.w900,
                                  fontSize: AppStyles.getDynamicFontSize(width),
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "Savor the Mediterranean in the Heart of Toledo.",
                              style: TextStyle(
                                fontFamily: GoogleFonts.montserrat().fontFamily,
                                fontWeight: FontWeight.w300,
                                fontSize: AppStyles.getDynamicFontSize(width),
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                            ),
                           
                            //adsadasdasdasdas
                            HoverGridView()
                          ],
                        ),
                      ),
                      Container(
                        height: height,
                        width: AppStyles.getResponsiveWidth(width, 0.35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           Container(
  width: AppStyles.getResponsiveWidth(width, 0.35),
  height: AppStyles.getResponsiveHeight(height, 0.5),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      image: AssetImage("assets/burgur.png"),
      fit: BoxFit.contain,  // This ensures the full image is displayed
    ),
  ),
),

                            Container(
                              margin: EdgeInsets.only(
                                  top: AppStyles.getItemSpacing(width) * 0.2),
                              height: 60,
                              width: 280,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    width: 1.85,
                                    color: Color.fromRGBO(228, 198, 32, 1.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(111, 47, 32, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(ReservationPage());
                                },
                                child: Text(
                                  "BOOK A TABLE",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontSize:
                                        AppStyles.getDynamicFontSize(width),
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3.3,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: AppStyles.getItemSpacing(width)),
                              height: 60,
                              width: 280,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    width: 1.85,
                                    color: Color.fromRGBO(228, 198, 32, 1.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(228, 198, 32, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(MenuPage());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("pngs/icon1.png"),
                                    Text(
                                      "ORDER ONLINE",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            GoogleFonts.lato().fontFamily,
                                        fontSize:
                                            AppStyles.getDynamicFontSize(width),
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 3.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget carouselItem(int index) {
    // Sample data for the carousel
    final foodItems = [
      'Grill Kebab',
      'Tornado Burger',
      'Hummus',
      'Fries',
      'Pizza'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: index == 1
              ? Colors.white
              : const Color(
                  0xFFE8F5E9), // Taller item white, others light green
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        width: 200,
        height: index == 1 ? 300 : 250, // Main container is taller
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                foodItems[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverGridView extends StatefulWidget {
  @override
  _HoverGridViewState createState() => _HoverGridViewState();
}

class _HoverGridViewState extends State<HoverGridView> {
  int? hoveredIndex; // To track the hovered item index
  final DataController dataController = Get.put(DataController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      width: AppStyles.getResponsiveWidth(width, 0.85),
      height: AppStyles.getResponsiveHeight(height, 0.4),
      child: Center(
        child: Container(
          height: 327,
          margin: EdgeInsets.only(top: 30, bottom: 30),
          child: Obx(() {
            // Use Obx to observe changes in the data
            if (!dataController.isLoaded.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            }

            return GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // One row for horizontal scroll
                mainAxisSpacing: 16, // Adjust this to reduce gaps between items
                childAspectRatio: 1.4,
              ),
              itemCount: dataController.items.length,
              itemBuilder: (context, index) {
                var item = dataController.items[index];
                String imgContent = dataController.imgData[index];

                return MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      hoveredIndex = index; // Set hovered index on enter
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      hoveredIndex = null; // Reset hovered index on exit
                    });
                  },
                  child: Container(
                    height: 327,
                    width: 209,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: hoveredIndex == index
                          ? Colors.green.shade50 // Change color on hover
                          : Colors.white, // Default color for non-hovered items
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 52, // Adjust the size of the circle
                          backgroundImage: imgContent.isNotEmpty
                              ? MemoryImage(base64Decode(imgContent))
                              : null, // Display image if available
                        ),
                        SizedBox(height: 16),
                        Text(
                          item['ItemName'] ?? 'Unknown Item',
                          style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['DepartmentName'] ?? 'Unknown Department',
                          style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
