import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:restro_web/views/ContactPage/contactPage.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignup.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignupMobile.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';

class NavbarMobile extends StatefulWidget {
    final int number;
 NavbarMobile({ Key? key, required this.number }) : super(key: key);

  @override
  State<NavbarMobile> createState() => _NavbarMobileState();
}

class _NavbarMobileState extends State<NavbarMobile> {
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 50, child: Image.asset("assets/pngs/logo.png")),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavBarItem(
                  "HOME",  widget.number == 0
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white, HomePage(), AppStyles.mobileFontSize),
                  // SizedBox(width: 0.2,),
              Container(
                margin: EdgeInsets.only(left: 53),
                child: _buildNavBarItem(
                    "MENU", widget.number == 1
                        ? Color.fromRGBO(228, 198, 32, 100)
                        : Colors.white, MenuPage(), AppStyles.mobileFontSize),
              ),
              _buildNavBarItem("ABOUT US",  widget.number == 2
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white, AboutPage(),
                  AppStyles.mobileFontSize),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavBarItem("RESERVATION",  widget.number == 3
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white,
                  ReservationPage(), AppStyles.mobileFontSize),
                   _buildNavBarItem("LOGIN",  widget.number == 3
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white,
                  LoginSignupMobile(), AppStyles.mobileFontSize),
            
              _buildNavBarItem("CONTACT", widget.number == 4
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white, ContactPage(),
                  AppStyles.mobileFontSize),
            ],
          ),
          SizedBox(height: 10),
         
        ],
      ),
    );
  }

  Widget _buildNavBarItem(
      String title, Color color, Widget page, double fontSize) {
    return InkWell(
      onTap: () {
        Get.to(page,
            transition: Transition.fadeIn, duration: Duration(seconds: 1));
      },
      child: _NavBarItem(
        title: title,
        color: color,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildSpacer(double spacing) {
    return SizedBox(width: spacing);
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;

  const _NavBarItem({
    Key? key,
    required this.title,
    required this.color,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: color,
      ),
    );
  }
}