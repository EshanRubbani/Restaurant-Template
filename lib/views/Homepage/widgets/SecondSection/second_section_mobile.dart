import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/GLobals/appStyles.dart';
import 'package:restro_web/views/AboutPage/aboutPage.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'package:intl/intl.dart';

class SecondSectionMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      height: height * 2.62, // Adjusted height for better layout
      child: Container(
        width: width,
        height: height * 2.5, // Adjusted height for better layout
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width,
              height: AppStyles.getResponsiveHeight(height * 2, 0.55),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top:
                          height * 0.05), // Adjusted for different screen sizes
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
                            height: AppStyles.getResponsiveHeight(height, 0.5),
                            // Adjusted height
                            color: const Color.fromRGBO(189, 189, 189, 1.0),
                            child: Image.asset(
                              "assets/shop (8).png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: AppStyles.getResponsiveWidth(
                                width, 0.8), // Adjusted width

                            height: AppStyles.getResponsiveHeight(height, 0.5),
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
                        left:
                            width * 0.05, // Adjusted for different screen sizes
                        top: height * 0.35,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.04),
                          width: AppStyles.getResponsiveWidth(width, 0.6),
                          color: const Color(0xFFF7F0D9), // Light cream color
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    color:
                                        const Color.fromRGBO(144, 163, 177, 1),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'ABOUT',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
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
                                width: AppStyles.getResponsiveWidth(width, 0.5),
                                child: Column(
                                  children: [
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: AppStyles.getDynamicFontSize(
                                            width * 0.5),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: AppStyles.getDynamicFontSize(
                                            width * 0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
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
                                          fontSize:
                                              AppStyles.getDynamicFontSize(
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
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1.5,
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
                    child: Text(
                      "Fresh & Delicious",
                      style: TextStyle(
                        fontFamily: GoogleFonts.literata().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: const Color.fromRGBO(225, 244, 226, 1),
                        letterSpacing: -2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 70,
                    child: Text(
                      "Reserve your table and indulge in our chef's handcrafted Mediterranean delights.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: AppStyles.getDynamicFontSize(width),
                        color: const Color.fromRGBO(144, 163, 177, 1),
                      ),
                    ),
                  ),
                  buildReservationSection(context),
                  SizedBox(
                    height: 25,
                  ),
                  buildFormSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container buildReservationSection(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildMenuRow(context),
        SizedBox(height: 16), // Adjust spacing
        build2MenuRow(context),
        SizedBox(height: 16), // Adjust spacing
      ],
    ),
  );
}

Center buildFormSection(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController peopleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  void sendFormEmail(
      String name, String people, String date, String phone, String email) {
    js.context.callMethod('sendEmail', [name, people, date, phone, email]);
  }

  final _formKey = GlobalKey<FormState>();

  void _sendEmail() {
    sendFormEmail(
      nameController.text,
      peopleController.text,
      dateController.text,
      phoneController.text,
      emailController.text,
    );
  }

  return Center(
    child: Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 244, 226, 1),
          borderRadius: BorderRadius.circular(12)),
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.only(top: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Reservation",
            style: TextStyle(
              fontFamily: GoogleFonts.literata().fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width *
                  0.05, // Responsive font size
              color: const Color.fromRGBO(187, 58, 18, 1),
            ),
          ),
          Text(
            "Online Booking",
            style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.width *
                  0.03, // Responsive font size
              color: const Color.fromRGBO(40, 37, 46, 1),
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width * 0.6, // Responsive width
            child: Text(
              "Reserve Your Mediterranean Escape Today.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.width *
                    0.03, // Responsive font size
                color: const Color.fromRGBO(144, 163, 177, 1),
              ),
            ),
          ),
          SizedBox(height: 16),
          buildFormFields(context, nameController, peopleController,
              dateController, phoneController, emailController, _formKey),
          SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
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
                  // _sendEmail();
                  Get.snackbar(
                    "Success", // Title
                    "Reservation details submitted successfully!", // Message
                    snackPosition:
                        SnackPosition.TOP, // Position of the snackbar
                    backgroundColor: Colors.green, // Background color
                    colorText: Colors.white, // Text color
                    duration: Duration(seconds: 3), // Display duration
                  );
                  emailController.clear();
                  nameController.clear();
                  peopleController.clear();
                  dateController.clear();
                  phoneController.clear();
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
                          0.03, // Responsive font size
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
          SizedBox(
            height: 25,
          )
        ],
      ),
    ),
  );
}

final DataController menuController =
    Get.put(DataController()); // Initialize the controller

Widget buildMenuRow(BuildContext context) {
  return Obx(() {
    if (!menuController.isLoaded.value) {
      return Center(child: CircularProgressIndicator());
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildMenuTile(
            context, menuController.items[0], menuController.imgData[0]),
        SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.02), // Responsive spacing
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildMenuTile(
            context, menuController.items[2], menuController.imgData[2]),
        SizedBox(
            width:
                MediaQuery.of(context).size.width * 0.02), // Responsive spacing
        buildMenuTile(
            context, menuController.items[3], menuController.imgData[3]),
      ],
    );
  });
}

Widget buildMenuTile(
    BuildContext context, Map<String, dynamic> item, String imgContent) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.32,
    width: MediaQuery.of(context).size.width * 0.4, // Responsive width
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.4, // Responsive width
          color: Color.fromRGBO(189, 189, 189, 1),

          child: imgContent.isNotEmpty
              ? Image.memory(
                  base64Decode(imgContent),
                  fit: BoxFit.cover,
                )
              : Center(child: Text('No Image')),
        ),
        Positioned(
          bottom: -20,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(55, 52, 62, 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Text(
                    item['ItemName'] ?? 'Unknown Item',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.literata().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width *
                          0.03, // Responsive font size
                      color: Color.fromRGBO(255, 244, 226, 1),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item['DepartmentName'] ?? 'Unknown Department',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.width *
                        0.019, // Responsive font size
                    color: Color.fromRGBO(144, 163, 177, 1),
                  ),
                ),
                SizedBox(height: 5),
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
  GlobalKey<FormState> formKey,
) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        buildNameFormField(context, "Name", nameController),
        SizedBox(height: 8),
        buildPeopleFormField(context, "People", peopleController),
        SizedBox(height: 8),
        buildDateFormField(context, "Date", dateController, context),
        SizedBox(height: 8),
        buildPhoneFormField(context, "Phone", phoneController),
        SizedBox(height: 8),
        buildEmailFormField(context, "Email address", emailController),
      ],
    ),
  );
}

Widget buildNameFormField(
    BuildContext context, String label, TextEditingController controller) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    height: 50,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(
          color: const Color.fromRGBO(144, 163, 177, 1),
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * 0.03,
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        // Name validation: Only alphabets
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
          return 'Name should contain only alphabets';
        }
        return null;
      },
    ),
  );
}

Widget buildPeopleFormField(
    BuildContext context, String label, TextEditingController controller) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    height: 50,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(
          color: const Color.fromRGBO(144, 163, 177, 1),
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * 0.03,
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the number of people';
        }
        // Number validation: Only digits
        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'Please enter a valid number';
        }
        return null;
      },
    ),
  );
}

Widget buildDateFormField(BuildContext context, String label,
    TextEditingController controller, BuildContext ctx) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    height: 50,
    child: TextFormField(
      controller: controller,
      readOnly: true, // Disable text input and only allow date picking
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(
          color: const Color.fromRGBO(144, 163, 177, 1),
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * 0.03,
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: ctx,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
    ),
  );
}

Widget buildPhoneFormField(
    BuildContext context, String label, TextEditingController controller) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    height: 50,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(
          color: const Color.fromRGBO(144, 163, 177, 1),
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * 0.03,
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        // Phone validation: Only digits and length check (adjust as needed)
        if (!RegExp(r'^[0-9]+$').hasMatch(value) || value.length < 10) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    ),
  );
}

Widget buildEmailFormField(
    BuildContext context, String label, TextEditingController controller) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.6,
    height: 50,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(
          color: const Color.fromRGBO(144, 163, 177, 1),
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.width * 0.03,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        // Email validation: Simple regex for email
        if (!RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    ),
  );
}
