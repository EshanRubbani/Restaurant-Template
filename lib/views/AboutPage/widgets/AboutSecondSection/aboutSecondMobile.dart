import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/widgets/CenterdView/centeredView.dart';

import '../../../../GLobals/appStyles.dart';

class AboutSecondMobile extends StatelessWidget {
const AboutSecondMobile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
        double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/pngs/aboutbg.png",fit: BoxFit.cover,)),
          Container(
          width: width,
      height: height * 3, // Adjusted height for better layout
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width,
              height: AppStyles.getResponsiveHeight(height * 2, 0.45),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.05), // Adjusted for different screen sizes
                  child: Stack(
                    children: [
                      // Background boxes
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: AppStyles.getResponsiveWidth(
                                width, 0.8), // Adjusted width
                            height: AppStyles.getResponsiveHeight(height, 0.3),
                            // Adjusted height
                            color: const Color.fromRGBO(189, 189, 189, 1.0),
                          child: Image.asset("assets/shop (8).png",fit: BoxFit.cover,),
        
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: AppStyles.getResponsiveWidth(
                                width, 0.8), // Adjusted width
        
                            height: AppStyles.getResponsiveHeight(height, 0.5),
                            color: const Color.fromRGBO(189, 189, 189, 1.0),
                          child: Image.asset("assets/shop (10).png",fit: BoxFit.cover,),
        
                          ),
                        ],
                      ),
                      // "About Us" Container stacked over the background boxes
                     
                    ],
                  ),
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