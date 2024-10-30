import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:restro_web/views/ContactPage/contactPage.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignup.dart';
import 'package:restro_web/views/MenuPage/menupage.dart';
import 'package:restro_web/views/ResvervationPage/reservationPage.dart';

class NavbarDesktop extends StatefulWidget {
   final int number;
 NavbarDesktop({ Key? key, required this.number }) : super(key: key);

  @override
  State<NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {
  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize = AppStyles.getDynamicFontSize(screenWidth);
    double logoWidth = AppStyles.getLogoWidth(screenWidth);
    double itemSpacing = AppStyles.getItemSpacing(screenWidth);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
              width: logoWidth, child: Row(
                children: [
                  SizedBox(width: 10,),
                  // Image.asset("assets/pngs/logo.png"),
                  SizedBox(width: 5,),
                   Text(
                              "Your Restaurant",
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
              )),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildNavBarItem(
                  "HOME",
                  widget.number == 0
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white,
                  HomePage(),
                  fontSize),
              _buildSpacer(itemSpacing),
              _buildNavBarItem(
                  "MENU",
                  widget.number == 1
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white,
                  MenuPage(),
                  fontSize),
              _buildSpacer(itemSpacing),
              _buildNavBarItem(
                  "ABOUT US",
                  widget.number == 2
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white,
                  AboutPage(),
                  fontSize),
              _buildSpacer(itemSpacing),
              _buildNavBarItem(
                  "RESERVATION",
                  widget.number == 3
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white,
                  ReservationPage(),
                  fontSize),
              _buildSpacer(itemSpacing),
              _buildNavBarItem(
                  "CONTACT",
                  widget.number == 4
                      ? Color.fromRGBO(228, 198, 32, 100)
                      : Colors.white,
                  ContactPage(),
                  fontSize),
              _buildSpacer(itemSpacing),
              Container(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 1.85,
                      color: Color.fromRGBO(228, 198, 32, 1.0),
                    ),
                    backgroundColor: const Color.fromRGBO(228, 198, 32, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  onPressed: () {
                   Get.to(LoginSignup());
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: AppStyles.getDynamicFontSize(
                          MediaQuery.of(context).size.width * 0.8),
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
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