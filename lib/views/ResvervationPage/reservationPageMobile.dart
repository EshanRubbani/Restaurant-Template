import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/ContactPage/contactPage.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationFirst/reservationFirst.dart';
import 'package:restro_web/views/ResvervationPage/Widgets/ReservationSection/reservationSection.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignupMobile.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationPageMobile extends StatefulWidget {
  const ReservationPageMobile({Key? key}) : super(key: key);

  @override
  _ReservationPageMobileState createState() => _ReservationPageMobileState();
}

class _ReservationPageMobileState extends State<ReservationPageMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(_controller);
  }

  void _toggleDrawer() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer integration
      appBar: AppBar(
            backgroundColor: Color.fromRGBO(85, 83, 89, 1),
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
            height: 50,
               child: Row(
                children: [
                  SizedBox(width: 10,),
                  // Image.asset("assets/pngs/logo.png"),
                  SizedBox(width: 5,),
                   Text(
                              "Your Restaurant Name",
                              style: TextStyle(
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    AppStyles.getDynamicFontSize(MediaQuery.of(context).size.width * 1.5),
                                color: const Color.fromRGBO(228, 198, 32, 1),
                                letterSpacing: 1.2,
                              ),
                            ),
                ],
              )),
            ),
            leadingWidth: 250,
            actions: [
              IconButton(
                icon: Icon(Icons.menu, color: Color.fromRGBO(228, 198, 32, 1), size: 30),
                onPressed: _toggleDrawer, // Drawer button on the right
              ),
            ],
            elevation: 0,
          ),
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReservationFirst(),
                ReservationSection(),
                secondSection(context),
                CarasoulSlider(),
                footer(),
              ],
            ),
          ),
          // Animated drawer
          SlideTransition(
            position: _slideAnimation,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(85, 83, 89, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                   
                    // Navigation items
                    _buildDrawerItem("HOME", HomePage()),
                    SizedBox(height: 10),
                    _buildDrawerItem("MENU", MenuPage()),
                    SizedBox(height: 10),
                    _buildDrawerItem("ABOUT US", AboutPage()),
                    SizedBox(height: 10),
                    _buildDrawerItem("RESERVATION", ReservationPage()),
                    SizedBox(height: 10),
                    _buildDrawerItem("LOGIN", LoginSignupMobile()),
                    SizedBox(height: 10),
                    _buildDrawerItem("CONTACT", ContactPage()),
                    Spacer(),
                    Container(
                      width: 176,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                           
                            child: Image.asset("assets/pngs/facebook.png"),
                          ),
                          InkWell(
                                                       child: Image.asset("assets/pngs/twitter.png"),
                          ),
                          InkWell(
                           
                            child: Image.asset("assets/pngs/instagram.png"),
                          ),
                          InkWell(
                           
                            child: Image.asset("assets/pngs/youtube.png"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "Your Restaurant Name",
                        style:
                            TextStyle(color: Color.fromRGBO(228, 198, 32, 1)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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

  Widget _buildDrawerItem(String title, Widget page) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          color: Color.fromRGBO(228, 198, 32, 1),
        ),
      ),
      onTap: () {
        _toggleDrawer(); // Close the drawer
        Get.to(page,
            transition: Transition.fadeIn, duration: Duration(seconds: 1));
      },
    );
  }

  Container secondSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 90),
      height: MediaQuery.of(context).size.height * 0.68,
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
          SizedBox(
            height: 16,
          ),
          DynamicMenuGrid(),
        ],
      ),
    );
  }
}

class DynamicMenuGrid extends StatelessWidget {
  final DataController controller =
      Get.put(DataController()); // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 270,
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
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              if (controller.items.isNotEmpty &&
                  controller.imgData.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0), // Reduced padding for mobile
                  child: Container(
                    height: 200, // Reduced height
                    width: 200, // Reduced width
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // Display the image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              12.0), // Smaller corner radius
                          child: Container(
                            width: 180, // Adjusted width for mobile
                            height: 140, // Adjusted height for mobile
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
                          bottom: 20, // Adjusted positioning for mobile
                          child: Container(
                            width: 140, // Reduced width for mobile
                            height: 120, // Reduced height for mobile
                            color: Color.fromRGBO(55, 52, 62, 1),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Display the ItemName from the controller
                                Text(
                                  controller.items[index]['ItemName'] ??
                                      "Unknown",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.literata().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16, // Reduced font size
                                    color: Color.fromRGBO(255, 244, 226, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 4, // Reduced spacing
                                ),
                                // Display the description
                                Text(
                                  controller.items[index]['DepartmentName'] ??
                                      "Unknown",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14, // Reduced font size
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
