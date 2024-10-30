import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/GLobals/constants.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'dart:js' as js;

class SecondSectionDesktop extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(111, 47, 32, 1.0),
            Color.fromRGBO(40, 37, 46, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: width,
      height: height * 2.2, // Adjusted height for better layout
      child: Column(
        children: [
          Container(
            width: width,
            height: AppStyles.getResponsiveHeight(height * 2, 0.42),
            child: Padding(
              padding: EdgeInsets.only(
                  top: height * 0.05), // Adjusted for different screen sizes
              child: Stack(
                children: [
                  // Background boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 556),
                        width: AppStyles.getResponsiveWidth(
                            width, 0.4), // Adjusted width
                        height: AppStyles.getResponsiveHeight(
                            height, 0.55), // Adjusted height
                        color: const Color.fromRGBO(189, 189, 189, 1.0),
                        child: Image.asset(
                          "assets/shop (8).png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 457,
                        ),
                        width: width < 950
                            ? 350
                            : AppStyles.getResponsiveWidth(width,
                                0.35), // Responsive based on screen width
                        height: AppStyles.getResponsiveHeight(height, 0.65),
                        color: const Color.fromRGBO(189, 189, 189, 1.0),
                        child: Image.asset(
                          "assets/shop (10).png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  // "About Us" Container stacked over the background boxes
                  Positioned(
                    left: width * 0.1, // Adjusted for different screen sizes
                    top: height * 0.18,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 487),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.04),
                      width: AppStyles.getResponsiveWidth(width, 0.4),
                      color: const Color(0xFFF7F0D9), // Light cream color
                      height: AppStyles.getResponsiveHeight(height, 0.49),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                color: const Color.fromRGBO(144, 163, 177, 1),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'ABOUT',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  color: Colors.grey,
                                  fontSize: AppStyles.getDynamicFontSize(
                                      width * 0.9), // Dynamic sizing
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'About Us',
                            style: TextStyle(
                              fontFamily: GoogleFonts.literata().fontFamily,
                              color: const Color.fromRGBO(
                                  228, 198, 32, 1), // Yellow color
                              fontSize:
                                  AppStyles.getDynamicFontSize(width * 1.1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(bottom: 30),
                            width: AppStyles.getResponsiveWidth(width, 0.35),
                            height: AppStyles.getResponsiveHeight(height, 0.20),
                            child: Column(
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: AppStyles.getDynamicFontSize(
                                        width * 0.5),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: AppStyles.getDynamicFontSize(
                                        width * 0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 160,
                            height: 43,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(AboutPage());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                side: const BorderSide(
                                  color: Colors.amber,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Learn More',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppStyles.getDynamicFontSize(
                                          width * 0.5),
                                      color: Colors.amber,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.amber,
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
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
                      const SizedBox(width: 8),
                      Text(
                        "SERVE",
                        style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: AppStyles.getDynamicFontSize(width),
                          color: const Color.fromRGBO(228, 198, 32, 1),
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 72,
                    child: Text(
                      "Fresh & Delicious",
                      style: TextStyle(
                        fontFamily: GoogleFonts.literata().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 52,
                        color: const Color.fromRGBO(225, 244, 226, 1),
                        letterSpacing: -2,
                      ),
                    ),
                  ),
                  Container(
                    height: 48,
                    child: Text(
                      "Reserve your table and indulge in our chef's handcrafted Mediterranean delights.",
                      style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: AppStyles.getDynamicFontSize(width),
                        color: const Color.fromRGBO(144, 163, 177, 1),
                      ),
                    ),
                  ),
                  buildReservationSection(
                      context,
                      _nameController,
                      _peopleController,
                      _dateController,
                      _phoneController,
                      _emailController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container buildReservationSection(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController peopleController,
    TextEditingController dateController,
    TextEditingController phoneController,
    TextEditingController emailController) {
  final _formKey = GlobalKey<FormState>();

  void sendFormEmail(
      String name, String people, String date, String phone, String email) {
    js.context.callMethod('sendEmail', [name, people, date, phone, email]);
  }

  void _sendEmail() {
    sendFormEmail(
      nameController.text,
      peopleController.text,
      dateController.text,
      phoneController.text,
      emailController.text,
    );
  }

  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Side - Menu Section
        DynamicMenuGrid(),
        SizedBox(width: 32), // Adjust spacing between menu and form
        // Right Side - Reservation Form
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 244, 226, 1),
                borderRadius: BorderRadius.circular(12)),
            height: 620,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Reservation",
                  style: TextStyle(
                    fontFamily: GoogleFonts.literata().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width *
                        0.03, // Responsive font size
                    color: const Color.fromRGBO(187, 58, 18, 1),
                  ),
                ),
                Text(
                  "Online Booking",
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width *
                        0.02, // Responsive font size
                    color: const Color.fromRGBO(40, 37, 46, 1),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  width: MediaQuery.of(context).size.width *
                      0.35, // Responsive width
                  child: Text(
                    "Reserve Your Mediterranean Escape Today.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.width *
                          0.011, // Responsive font size
                      color: const Color.fromRGBO(144, 163, 177, 1),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                buildFormFields(context, nameController, peopleController,
                    dateController, phoneController, emailController, _formKey),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.06,
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
                      if (_formKey.currentState!.validate()) {
                        //   _sendEmail();
                  Get.snackbar(
                    "Success", // Title
                    "Reservation details submitted successfully!", // Message
                    snackPosition:
                        SnackPosition.TOP, // Position of the snackbar
                    backgroundColor: Colors.green, // Background color
                    colorText: Colors.white, // Text color
                    duration: Duration(seconds: 3), // Display duration
                  );
                  nameController.clear();
                  peopleController.clear();
                  dateController.clear();
                  phoneController.clear();
                  emailController.clear();
                  // Add further logic to process the form (e.g., sending email)
                } else {
                  // Form is invalid, show error snackbar
                  Get.snackbar(
                    "Error", // Title
                    "Please correct the errors in the form.", // Message
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    duration: Duration(seconds: 3),
                  );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book Now",
                          style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.width *
                                0.015, // Responsive font size
                            color: const Color.fromRGBO(40, 37, 46, 1),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: const Color.fromRGBO(40, 37, 46, 1),
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildFormFields(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController peopleController,
    TextEditingController dateController,
    TextEditingController phoneController,
    TextEditingController emailController,
    Key _formKey) {
  return Form(
    key: _formKey, // Attach the form key here
    child: Column(
      children: [
        buildFormField(
          context,
          "Name",
          nameController,
          TextInputType.text,
          filteringTextInputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
          ],
        ),
        SizedBox(height: 12),
        buildFormField(
          context,
          "1 People",
          peopleController,
          TextInputType.number,
          filteringTextInputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
        SizedBox(height: 12),
        buildDateField(context, dateController),
        SizedBox(height: 12),
        buildFormField(
          context,
          "Phone",
          phoneController,
          TextInputType.phone,
          filteringTextInputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: (value) {
            if (value!.isEmpty || value.length < 10) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
        ),
        SizedBox(height: 12),
        buildFormField(
          context,
          "Email address",
          emailController,
          TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty ||
                !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget buildFormField(
  BuildContext context,
  String label,
  TextEditingController controller,
  TextInputType keyboardType, {
  List<TextInputFormatter>? filteringTextInputFormatters,
  String? Function(String?)? validator,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.3,
    height: MediaQuery.of(context).size.height * 0.06,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: filteringTextInputFormatters,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(144, 163, 177, 1), width: 1.0),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: const Color.fromRGBO(144, 163, 177, 1),
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize:
              MediaQuery.of(context).size.width * 0.01, // Responsive font size
        ),
      ),
    ),
  );
}

Widget buildDateField(
    BuildContext context, TextEditingController dateController) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.3,
    height: MediaQuery.of(context).size.height * 0.06,
    child: TextFormField(
      controller: dateController,
      readOnly: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(144, 163, 177, 1), width: 1.0),
        ),
        labelText: "Date",
        labelStyle: TextStyle(
          color: const Color.fromRGBO(144, 163, 177, 1),
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * 0.01,
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        }
      },
    ),
  );
}

class DynamicMenuGrid extends StatelessWidget {
  final DataController menuController =
      Get.put(DataController()); // Initialize the controller

  Widget buildMenuRow(BuildContext context) {
    return Obx(() {
      if (!menuController.isLoaded.value) {
        return Center(child: CircularProgressIndicator());
      }

      return Row(
        children: [
          buildMenuTile(
              context, menuController.items[0], menuController.imgData[0]),
          SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.02), // Responsive spacing
          buildMenuTile(
              context, menuController.items[1], menuController.imgData[1]),
        ],
      );
    });
  }

  Widget build2MenuRow(BuildContext context) {
    return Obx(() {
      if (!menuController.isLoaded.value) {
        return Center(child: CircularProgressIndicator());
      }

      return Row(
        children: [
          buildMenuTile(
              context, menuController.items[2], menuController.imgData[2]),
          SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.02), // Responsive spacing
          buildMenuTile(
              context, menuController.items[3], menuController.imgData[3]),
        ],
      );
    });
  }

  Widget buildMenuTile(
      BuildContext context, Map<String, dynamic> item, String imgContent) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.22, // Responsive width
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.35,
              color: Color.fromRGBO(189, 189, 189, 1),
              child: imgContent.isNotEmpty
                  ? Image.memory(
                      base64Decode(imgContent),
                      fit: BoxFit.cover,
                    )
                  : Center(child: Text('No Image')),
            ),
          ),
          Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 52, 62, 1),
                  borderRadius: BorderRadius.circular(8)),
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item['ItemName'] ?? 'Unknown Item',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.literata().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width *
                          0.012, // Responsive font size
                      color: Color.fromRGBO(255, 244, 226, 1),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item['DepartmentName'] ?? 'Unknown Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.width *
                          0.01, // Responsive font size
                      color: Color.fromRGBO(144, 163, 177, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildMenuRow(context),
        SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.05), // Adjust spacing
        build2MenuRow(context),
      ],
    );
  }
}
