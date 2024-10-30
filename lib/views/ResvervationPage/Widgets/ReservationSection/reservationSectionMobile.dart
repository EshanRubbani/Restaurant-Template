import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:intl/intl.dart';

class ReservationSectionMobile extends StatelessWidget {
  const ReservationSectionMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _peopleController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    return Container(
      color: Color.fromRGBO(40, 37, 46, 1),
      padding: EdgeInsets.only(top: 100),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      "RESERVATION",
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 14,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(228, 198, 32, 1)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Make a Reservation",
                  style: TextStyle(
                      fontFamily: GoogleFonts.literata().fontFamily,
                      fontSize: 52,
                      letterSpacing: -2,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 244, 226, 1)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Secure Your Table at LaVie Mediterranean Grill and Indulge in a Culinary Journey Through the Mediterranean. Our Reservations are Available Online or by Phone.",
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(144, 163, 177, 1)),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 555,
                  height: 454,
                  color: Color.fromRGBO(189, 189, 189, 1),
                  child: Image.asset(
                    "assets/shop (8).png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 685,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 244, 226, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Reservation",
                  style: TextStyle(
                      fontFamily: GoogleFonts.literata().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                      color: const Color.fromRGBO(187, 58, 18, 1)),
                ),
                Text(
                  "Online Booking",
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: const Color.fromRGBO(40, 37, 46, 1),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 72,
                  margin: const EdgeInsets.only(
                      left: 5, right: 5, top: 5, bottom: 5),
                  child: Text(
                    "Reserve Your Mediterranean Escape Today.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color.fromRGBO(144, 163, 177, 1),
                    ),
                  ),
                ),
                buildform(context, _nameController, _peopleController,
                    _dateController, _phoneController, _emailController),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildform(BuildContext context,TextEditingController nameController,
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
      height: 363,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Form(
        key: _formKey, // Attach the form key here


        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            width: 359,
            height: 48,
            child: TextFormField(
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null; // Valid input
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(144, 163, 177, 1), width: 1.0),
                ),
                labelText: "Name",
                labelStyle: TextStyle(
                  color: const Color.fromRGBO(144, 163, 177, 1),
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // People Field
          Container(
            width: 359,
            height: 48,
            child: TextFormField(
              controller: peopleController,
              validator: (value) {
                if (value!.isEmpty || int.tryParse(value) == null || int.parse(value) <= 0) {
                  return 'Please enter a valid number of people';
                }
                return null; // Valid input
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(144, 163, 177, 1), width: 1.0),
                ),
                labelText: "1 People",
                labelStyle: TextStyle(
                  color: const Color.fromRGBO(144, 163, 177, 1),
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Date Field
          Container(
            width: 359,
            height: 48,
            child: TextFormField(
              controller: dateController,
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please select a date';
                }
                return null; // Valid input
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(144, 163, 177, 1), width: 1.0),
                ),
                labelText: "Date",
                labelStyle: TextStyle(
                  color: const Color.fromRGBO(144, 163, 177, 1),
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
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
          ),
          const SizedBox(height: 16),

          // Phone Field
          Container(
            width: 359,
            height: 48,
            child: TextFormField(
              controller: phoneController,
              validator: (value) {
                if (value!.isEmpty || value.length < 10) {
                  return 'Please enter a valid phone number';
                }
                return null; // Valid input
              },
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(144, 163, 177, 1), width: 1.0),
                ),
                labelText: "Phone",
                labelStyle: TextStyle(
                  color: const Color.fromRGBO(144, 163, 177, 1),
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Email Field
          Container(
            width: 359,
            height: 48,
            child: TextFormField(
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null; // Valid input
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(144, 163, 177, 1), width: 1.0),
                ),
                labelText: "Email address",
                labelStyle: TextStyle(
                  color: const Color.fromRGBO(144, 163, 177, 1),
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 43,
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          width: 1.85, color: Color.fromRGBO(228, 198, 32, 1.0)),
                      backgroundColor: const Color.fromRGBO(228, 198, 32, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Book Now",
                          style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: const Color.fromRGBO(40, 37, 46, 1)),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color.fromRGBO(40, 37, 46, 1),
                          size: 14,
                          weight: 7,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
