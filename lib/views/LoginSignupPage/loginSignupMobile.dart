import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:restro_web/GLobals/constants.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignup.dart';

class LoginSignupMobile extends StatefulWidget {
  const LoginSignupMobile({Key? key}) : super(key: key);

  @override
  _LoginSignupMobileState createState() => _LoginSignupMobileState();
}

class _LoginSignupMobileState extends State<LoginSignupMobile> {
  final _signInFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phno = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController loginemail = TextEditingController();
  final TextEditingController loginpassword = TextEditingController();

  bool _isSignUp = false; // Toggle between Sign In and Sign Up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(40, 37, 46, 1),
        child: Center(
          child: SingleChildScrollView(
            // Wrap the content with SingleChildScrollView
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 400,
                    height: 200,
                    child: Image.asset('assets/pngs/logo.png'),
                  ),
                  // SizedBox(height: 0),
                  Text(
                    _isSignUp
                        ? "To keep connected with us please Sign Up with your personal info."
                        : "To keep connected with us please login with your personal info.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.3,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 20),

                  // AnimatedSwitcher for Sign In/Sign Up forms
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: _isSignUp ? signUpForm() : signInForm(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Sign In Form
  Widget signInForm() {
    return Form(
      key: _signInFormKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Sign In",
              style: GoogleFonts.poppins(
                color: Colors.white, // Changed text color to white
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 25),
            _buildSigninTextField("Email", Icons.email_rounded, loginemail,
                isEmail: true),
            SizedBox(height: 15),
            _buildSigninTextField(
                "Password", Icons.lock_person_rounded, loginpassword,
                obscureText: true, isPassword: true),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: Size(double.infinity, 60), // Full width button
              ),
              onPressed: () {
                // if (_signInFormKey.currentState!.validate()) {
                //   // Handle Sign In logic
                // }
                Get.to(HomePage());
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () {
                setState(() {
                  _isSignUp = true;
                });
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Sign Up Form
  Widget signUpForm() {
    return Form(
      key: _signUpFormKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Sign Up",
              style: GoogleFonts.poppins(
                color: Colors.white, // Changed text color to white
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 25),
            _buildSignUpTextField("First Name", Icons.person, firstname),
            SizedBox(height: 15),
            _buildSignUpTextField("Last Name", Icons.person, lastname),
            SizedBox(height: 15),
            _buildSignUpTextField("Email", Icons.email_rounded, email,
                isEmail: true),
            SizedBox(height: 15),
            _buildSignUpTextField("Phone", Icons.phone, phno, isPhone: true),
            SizedBox(height: 15),
            _buildSignUpTextField(
                "Password", Icons.lock_person_rounded, password,
                obscureText: true, isPassword: true),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: Size(double.infinity, 60), // Full width button
              ),
              onPressed: () {
                if (_signUpFormKey.currentState!.validate()) {
                  customerSignUp(
                      firstName: firstname.text,
                      lastName: lastname.text,
                      email: email.text,
                      mobile: phno.text,
                      password: password.text);
                }
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () {
                setState(() {
                  _isSignUp = false;
                });
              },
              child: Text(
                "Already have an account? Sign In",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for SignIn TextFields
  TextFormField _buildSigninTextField(
      String labelText, IconData iconData, TextEditingController controllers,
      {bool obscureText = false,
      bool isEmail = false,
      bool isPassword = false}) {
    return TextFormField(
      controller: controllers,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black), // Set input text color to black
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white), // Set label text color
        suffixIcon: Icon(iconData, color: Colors.white), // Set icon color
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        filled: true,
        fillColor: Colors.grey.shade800, // Darker background for text fields
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$labelText can't be empty";
        } else if (isEmail && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return "Enter a valid email";
        } else if (isPassword && value.length < 6) {
          return "Password must be at least 6 characters long";
        }
        return null;
      },
    );
  }

  // Helper function for SignUp TextFields
  TextFormField _buildSignUpTextField(
      String labelText, IconData iconData, TextEditingController controller,
      {bool obscureText = false,
      bool isEmail = false,
      bool isPhone = false,
      bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black), // Set input text color to black
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white), // Set label text color
        suffixIcon: Icon(iconData, color: Colors.white), // Set icon color
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        filled: true,
        fillColor: Colors.grey.shade800, // Darker background for text fields
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$labelText can't be empty";
        } else if (isEmail && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return "Enter a valid email";
        } else if (isPhone && !RegExp(r'^0[0-9]{10,11}$').hasMatch(value)) {
          return "Enter a valid phone number";
        } else if (isPassword && value.length < 6) {
          return "Password must be at least 6 characters long";
        }
        return null;
      },
    );
  }

  // Customer Sign Up function
  Future<void> customerSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
  }) async {
    final url =
        Uri.parse('https://cloudapi.ovvihq.com/api/Account/CustomerSignUp');

    // Request body
    final body = {
      'nvarCustFirstName': firstName,
      'nvarCustLastName': lastName,
      'nvarEmailAddress': email,
      'nvarMobileNo': mobile,
      'nvarPassword': password,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        Get.snackbar(
          "Success",
          "Account Created Successfully. Please Login",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
        Get.to(LoginSignup());
      } else {
        Get.snackbar(
          "Error",
          "Server error: ${response.statusCode}']}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
