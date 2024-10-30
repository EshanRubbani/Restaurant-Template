import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // Font sizes
  static double baseFontSize = 14;
  static double maxFontSize = 18;

  // Dynamic font size method
  static double getDynamicFontSize(double screenWidth) {
    return baseFontSize +
        (screenWidth > 800 ? (screenWidth - 800) / 100 : 0)
            .clamp(0, maxFontSize - baseFontSize);
  }

  // Spacing
  static double getItemSpacing(double screenWidth) {
    return screenWidth * 0.03;
  }

  // Logo width
  static double getLogoWidth(double screenWidth) {
    return screenWidth * 0.15;
  }

  // Mobile font size
  static double mobileFontSize = 12;

  // Responsive dimensions
  static double getResponsiveWidth(double screenWidth, double factor) {
    return screenWidth * factor;
  }

  static double getResponsiveHeight(double screenHeight, double factor) {
    return screenHeight * factor;
  }
}
