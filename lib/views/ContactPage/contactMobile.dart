import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactFirstSection/contactfirstSection.dart';
import 'package:restro_web/views/ContactPage/Widgets/ContactSecondSection/contactSecondSection.dart';
import 'package:restro_web/views/ContactPage/contactPage.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';
import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignupMobile.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobilePage extends StatefulWidget {
  const ContactMobilePage({Key? key}) : super(key: key);

  @override
  State<ContactMobilePage> createState() => _ContactMobilePageState();
}

class _ContactMobilePageState extends State<ContactMobilePage>
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
              children: [
                ContactfirstSection(),
                ContactsecondSection(),
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
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                   
                    _buildDrawerItem("HOME", HomePage()),
                    SizedBox(
                      height: 10,
                    ),
                    _buildDrawerItem("MENU", MenuPage()),
                    SizedBox(
                      height: 10,
                    ),

                    _buildDrawerItem("ABOUT US", AboutPage()),
                    SizedBox(
                      height: 10,
                    ),

                    _buildDrawerItem("RESERVATION", ReservationPage()),
                    SizedBox(
                      height: 10,
                    ),

                    _buildDrawerItem("LOGIN", LoginSignupMobile()),
                    SizedBox(
                      height: 10,
                    ),

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
                     // Already on contact page, can disable click if needed
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
            color: Color.fromRGBO(228, 198, 32, 1)),
      ),
      onTap: () {
        _toggleDrawer(); // Close the drawer
        Get.to(page,
            transition: Transition.fadeIn, duration: Duration(seconds: 1));
      },
    );
  }
}
