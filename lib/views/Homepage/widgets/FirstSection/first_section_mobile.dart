import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

class FirstSectionMobile extends StatelessWidget {
  final double width;
  final double height;

  FirstSectionMobile({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.85,
      child: Stack(
        children: [
          // Background SVG
          Positioned.fill(
            child: Image.asset(
              "assets/bg1.png",
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: AppStyles.getResponsiveWidth(width, 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                  
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Text(
                                                "AUTHENTIC MEDITERRANEAN \nCUISINE",
                                                style: TextStyle(
                                                  fontFamily: GoogleFonts.lato()
                                                      .fontFamily,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: AppStyles
                                                      .getDynamicFontSize(
                                                          width * 1.7),
                                                  color: const Color.fromRGBO(
                                                      228, 198, 32, 1),
                                                 
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Text(
                                                " Your Restaurant Name",
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.montserrat()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: AppStyles
                                                      .getDynamicFontSize(
                                                          width),
                                                  color: Colors.white,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Text(
                                                "Savor the Mediterranean in the Heart of Toledo.",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.montserrat()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: AppStyles
                                                      .getDynamicFontSize(
                                                          width * 0.8),
                                                  color: Colors.white,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.40,
                                     height:
                                    AppStyles.getResponsiveHeight(height, 0.35),
                                       decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/burgur.png"),
                                    fit: BoxFit
                                        .contain, // This ensures the full image is displayed
                                  ),
                                ),

                                  )
                                ],
                              ),
                            
                              Container(
                                width:
                                    AppStyles.getResponsiveWidth(width, 0.85),
                                                              child: HoverGridView(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: AppStyles.getResponsiveHeight(height, 0.12),
                          width: AppStyles.getResponsiveWidth(width, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: AppStyles.getItemSpacing(width) *
                                        0.2),
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                      width: 1.85,
                                      color:
                                          Color.fromRGBO(228, 198, 32, 1.0),
                                    ),
                                    backgroundColor: const Color.fromRGBO(
                                        111, 47, 32, 1.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(45),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.to(ReservationPage());
                                  },
                                  child: Text(
                                    "BOOK A TABLE",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily:
                                          GoogleFonts.lato().fontFamily,
                                      fontSize:
                                          AppStyles.getDynamicFontSize(
                                              width * 0.8),
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                margin: EdgeInsets.only(
                                    top: AppStyles.getItemSpacing(width) * 0.2) ,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                      width: 1.85,
                                      color:
                                          Color.fromRGBO(228, 198, 32, 1.0),
                                    ),
                                    backgroundColor: const Color.fromRGBO(
                                        228, 198, 32, 1.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(45),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.to(MenuPage());

                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Image.asset("pngs/icon1.png"),
                                      Text(
                                        "ORDER ONLINE",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily:
                                              GoogleFonts.lato().fontFamily,
                                          fontSize:
                                              AppStyles.getDynamicFontSize(
                                                  width * 0.8),
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1,
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
          ),
        ],
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
  final DataController dataController =
      Get.put(DataController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      width: AppStyles.getResponsiveWidth(width, 0.85),
      height: AppStyles.getResponsiveHeight(height, 0.38),
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
                childAspectRatio: 1.6,
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
                    height: 120,
                    width: 100,
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
