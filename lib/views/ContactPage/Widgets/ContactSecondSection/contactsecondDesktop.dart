import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:intl/intl.dart';
class ContactsecondDesktop extends StatelessWidget {
  const ContactsecondDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(150),
      height: MediaQuery.of(context).size.height * 1.5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(113, 47, 32, 1), // top color
            Color.fromRGBO(40, 37, 46, 1), // bottom color
          ],
          begin: Alignment.topCenter, // start from top center
          end: Alignment.bottomCenter, // end at bottom center
        ),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(48),
                  width: 585,
                  height: 450,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            color: const Color.fromRGBO(144, 163, 177, 1),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Contact",
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: const Color.fromRGBO(144, 163, 177, 1),
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Get In Touch",
                        style: TextStyle(
                          fontFamily: GoogleFonts.literata().fontFamily,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -2,
                          fontSize: 52,
                          color: const Color.fromRGBO(187, 58, 18, 1),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: 490,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(187, 58, 18, 1),
                              ),
                            ),
                            Text(
                              "Your Restaurant Address",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Phone",
                              style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(187, 58, 18, 1),
                              ),
                            ),
                            Text(
                              "Your Restaurant Phone No",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(187, 58, 18, 1),
                              ),
                            ),
                            Text(
                              "Your Restaurant Mail",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: 176,
                        height: 32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                             
                              child: Image.asset("pngs/facebookred.png"),
                            ),
                            InkWell(
                              
                              child: Image.asset("pngs/twitterred.png"),
                            ),
                            InkWell(
                             
                              child: Image.asset("pngs/instagramred.png"),
                            ),
                            InkWell(
                              
                              child: Image.asset("pngs/youtubered.png"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 585,
                  height: 250,
                  color: Color.fromRGBO(189, 189, 189, 1),
                  child: Image.asset("assets/shop (0).png",fit: BoxFit.cover,),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 585,
                  height: 200,
                  color: Color.fromRGBO(189, 189, 189, 1),
                  child: Image.asset("assets/shop (2).png",fit: BoxFit.cover,),

                ),
                buildMessage()
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildMessage() {
        final TextEditingController _nameController = TextEditingController();
    final TextEditingController _messageController = TextEditingController();

    final TextEditingController _emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    void sendFormEmail(String name, String Message, String email) {
      js.context.callMethod('sendMessage', [name, email, Message]);
    }

    void _sendEmail() {
      sendFormEmail(
        _nameController.text,
        _messageController.text,
        _emailController.text,
      );
    }
    return Container(
                  width: 585,
                  height: 500,
                  padding: EdgeInsets.all(32),
                  color: Color.fromRGBO(255, 244, 226, 1),
                  child: DottedBorder(
                    color: Color.fromRGBO(228, 198, 32, 1),
                    child: Center(
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Send Us Message",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.literata().fontFamily,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(187, 58, 18, 1)),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: 427,
                                child: Text(
                                  "Have a question or want to make a reservation? Please fill out the form below.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(144, 163, 177, 1)),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                                Container(
                      width: 427,
                      height: 48,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null; // Valid input
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Name",
                          labelStyle: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(144, 163, 177, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Email Field
                    Container(
                      width: 427,
                      height: 48,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null; // Valid input
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Email address",
                          labelStyle: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(144, 163, 177, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Message Field
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      width: 427,
                      height: 116,
                      child: TextFormField(
                        controller: _messageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a message';
                          }
                          return null; // Valid input
                        },
                        maxLines: 5, // Allow multiple lines for the message
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Message",
                          labelStyle: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(144, 163, 177, 1),
                          ),
                        ),
                      ),
                    ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 43,
                                width: 179,
                                child: ElevatedButton(
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
                        _nameController.clear();
                        _messageController.clear();
                       
                        _emailController.clear();
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(228, 198, 32, 1),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Send Message',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color.fromRGBO(40, 37, 46, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
  }
}
