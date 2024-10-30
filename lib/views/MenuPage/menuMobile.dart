import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthSection.dart';
import 'package:restro_web/views/MenuPage/widgets/MenuFirstSectionM/MenuFirstSectionM.dart';
import 'package:restro_web/views/MenuPage/widgets/discoverourmenu/discoverourmenu.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/views/ContactPage/contactPage.dart';
import 'package:restro_web/views/Homepage/homePage.dart';

import 'package:restro_web/views/ResvervationPage/reservationPage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignupMobile.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuMobile extends StatefulWidget {
  const MenuMobile({Key? key}) : super(key: key);

  @override
  _MenuMobileState createState() => _MenuMobileState();
}

class _MenuMobileState extends State<MenuMobile> with SingleTickerProviderStateMixin {
    ScrollController _pageScrollController =
      ScrollController(); // Add this to your class
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  @override
  void dispose() {
    _pageScrollController.dispose();
    super.dispose();
  }


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
          child: Container(child: Row(
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
                                    AppStyles.getDynamicFontSize(MediaQuery.of(context).size.width * 1.1),
                                color: const Color.fromRGBO(228, 198, 32, 1),
                                letterSpacing: 1.2,
                              ),
                            ),

            ],
          )), // Logo on the left
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
            controller: _pageScrollController,
            child: Column(
              children: [
                MenuFirstSectionM(),
                discoveroutmenu(scrollController: _pageScrollController),
                FourthSection(),
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
                    _buildDrawerItem("MENU", MenuMobile()),
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
                    SizedBox(height: 15,),
                    Center(child: Text("Your Restaurant Name",style: TextStyle(
                       color: Color.fromRGBO(228, 198, 32, 1)
                    ),),),
                    SizedBox(height: 15,),
                    
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
        Get.to(page, transition: Transition.fadeIn, duration: Duration(seconds: 1));
      },
    );
  }
}



Container secondSection(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Color.fromRGBO(40, 37, 46, 1),
    child: Container(
      margin: EdgeInsets.all(150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 161,
            width: 500,
            child: Column(
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
                      "MENUS",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 14,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(228, 198, 32, 1)),
                    ),
                  ],
                ),
                Text(
                  "Discover Our Menus",
                  style: TextStyle(
                      fontFamily: GoogleFonts.literata().fontFamily,
                      fontSize: 52,
                      letterSpacing: -2,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 244, 226, 1)),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id at mauris dis tincidunt ipsum faucibus ipsum.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(144, 163, 177, 1)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 660,
            width: MediaQuery.of(context).size.width,
            // color: Colors.black,
            margin: EdgeInsets.only(left: 150, right: 150),
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 60.0,
                  mainAxisSpacing: 60.0,
                  mainAxisExtent: 170
                  // Adjust this to match the image layout
                  ),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 540,
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.grey[300], // Placeholder for image
                      ),
                      Positioned(
                        left: 180,
                        right: 0, // to give space on the right side
                        top: 10, // Overlap with the image
                        bottom: 10,
                        child: Container(
                          width: 360,
                          height: 50,
                          padding: const EdgeInsets.all(16.0),
                          color: Color.fromRGBO(55, 52, 62, 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Fish Fillet',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            GoogleFonts.literata().fontFamily,
                                        color:
                                            Color.fromRGBO(255, 244, 226, 1)),
                                  ),
                                  Text(
                                    '\$30',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                        color: Color.fromRGBO(228, 198, 32, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Lorem ipsum dolor amet consec tetur adipi elit morbi id at mauris dis tincidunt.',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    color: Color.fromRGBO(144, 163, 177, 1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 43,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  elevation: 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View All Menus',
                      style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}