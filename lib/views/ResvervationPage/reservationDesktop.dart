import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationFirst/reservationFirst.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationSection/reservationSection.dart';


class ReservationDesktop extends StatelessWidget {
const ReservationDesktop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReservationFirst(),
        ReservationSection(),
          secondSection(context),
          CarasoulSlider(),
          footer()
        ],
      )),
    );
  }



  Container secondSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 90),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(40, 37, 46, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 8,
                color: const Color.fromRGBO(228, 198, 32, 1),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "SERVE",
                style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: const Color.fromRGBO(228, 198, 32, 1),
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
          Container(
            height: 72,
            width: 423,
            child: Text(
              "Fresh & Delicious",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: GoogleFonts.literata().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 32,
                color: const Color.fromRGBO(225, 244, 226, 1),
                letterSpacing: -2,
              ),
            ),
          ),
          Container(
            
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "Reserve your table and indulge in our chef's handcrafted Mediterranean delights.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color.fromRGBO(144, 163, 177, 1),
              ),
            ),
          ),
          SizedBox(height: 16,),
          DynamicMenuGrid(),
          
          
        ],
      ),
    );
  }
}



class DynamicMenuGrid extends StatelessWidget {
  final DataController controller = Get.put(DataController()); // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Center(
        child: Obx(() {
          // Display a loading indicator while the data is being fetched
          if (!controller.isLoaded.value) {
            return CircularProgressIndicator();
          }

          // Display the ListView when data is loaded
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length, // Use the controller's item count
            itemBuilder: (context, index) {
              // Check if we have valid data for this index
              if (controller.items.isNotEmpty && controller.imgData.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Display the image with rounded corners (if needed)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            width: 270,
                            height: 230,
                            color: Color.fromRGBO(189, 189, 189, 1),
                            child: controller.imgData[index].isNotEmpty
                                ? Image.memory(
                                    base64Decode(controller.imgData[index]),
                                    fit: BoxFit.cover,
                                  )
                                : Center(child: Text('No Image')),
                          ),
                        ),
                        // Text and description part
                        Positioned(
                          bottom: 20,
                          child: Container(
                            width: 200,
                            height: 152,
                            color: Color.fromRGBO(55, 52, 62, 1),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Display the ItemName from the controller
                                Text(
                                  controller.items[index]['ItemName'] ?? "Unknown",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.literata().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Color.fromRGBO(255, 244, 226, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                // Display the description (you can adjust this if the data structure changes)
                                Text(
                                  controller.items[index]['DepartmentName'] ?? "Unknown",
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
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text('No data available'));
              }
            },
          );
        }),
      ),
    );
  }
}
