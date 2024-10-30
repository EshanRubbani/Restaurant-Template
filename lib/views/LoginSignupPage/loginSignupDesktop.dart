import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:restro_web/GLobals/constants.dart';
import 'package:restro_web/views/Homepage/homePage.dart';
import 'package:restro_web/views/LoginSignupPage/loginSignup.dart';

class LoginSignupDesktop extends StatefulWidget {
  const LoginSignupDesktop({Key? key}) : super(key: key);

  @override
  _LoginSignupDesktopState createState() => _LoginSignupDesktopState();
}

class _LoginSignupDesktopState extends State<LoginSignupDesktop> {
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
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Stack(
              children: [
                // Left Side Panel (Sign In / Sign Up Text)
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.75 / 2,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.ease,
                    width: MediaQuery.of(context).size.width * 0.75 / 2,
                    height: MediaQuery.of(context).size.height * 0.75,
                    color: _isSignUp ? Colors.amber.shade600 : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:
                          _isSignUp ? [signUpSide(context)] : [signInForm()],
                    ),
                  ),
                ),
                // Right Side Panel (Form for Sign In / Sign Up)
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.75 / 2,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.ease,
                    width: MediaQuery.of(context).size.width * 0.75 / 2,
                    height: MediaQuery.of(context).size.height * 0.75,
                    color: _isSignUp ? Colors.white : Colors.amber.shade600,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                            _isSignUp ? [signUpForm()] : [signInSide(context)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signInForm() {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          Text(
            "Sign In",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.3,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 25),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: _buildSigninTextField(
                  "Email", Icons.email_rounded, loginemail,
                  isEmail: true)),
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: _buildSigninTextField(
                "Password", Icons.lock_person_rounded, loginpassword,
                obscureText: true, isPassword: true),
          ),
          const SizedBox(height: 25),
          Container(
            width: 200,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
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
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  signUpForm() {
    return Form(
      key: _signUpFormKey,
      child: Container(
        child: Column(
          children: [
            Text(
              "Sign Up",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 42,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 25),
            _buildSignUpTextField("First Name", Icons.person, firstname),
            const SizedBox(height: 15),
            _buildSignUpTextField("Last Name", Icons.person, lastname),
            const SizedBox(height: 15),
            _buildSignUpTextField(
                "Email", Icons.email_rounded, isEmail: true, email),
            const SizedBox(height: 15),
            _buildSignUpTextField("Phone", Icons.phone, isPhone: true, phno),
            const SizedBox(height: 15),
            _buildSignUpTextField(
                "Password", Icons.lock_person_rounded, password,
                obscureText: true, isPassword: true),
            const SizedBox(height: 25),
            Container(
              width: 200,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
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
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Future<void> customerSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
  }) async {
    final url = Uri.parse('https://cloudapi.ovvihq.com/api/Account/CustomerSignUp');

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

  Column signInSide(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 150,
          child: Image.asset('assets/lavieLogo.jpg'),
        ),
        const SizedBox(height: 10),
        Container(
          child: Text(
            "Welcome Back!",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 42,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.70 / 2,
          child: Text(
            "To keep connected with us please login with your personal info.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.3,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 12,
              side: BorderSide(color: Colors.black, width: 2),
            ),
            onPressed: () {
              setState(() {
                _isSignUp = true;
              });
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
        ),
      ],
    );
  }

  Column signUpSide(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 150,
          child: Image.asset('assets/lavieLogo.jpg'),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Welcome to (Your Restaurant Name)",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.70 / 2,
          child: Text(
            "To keep connected with us please Sign Up with your personal info.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.3,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 12,
              side: BorderSide(color: Colors.black, width: 2),
            ),
            onPressed: () {
              setState(() {
                _isSignUp = false;
              });
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper function for TextField widgets for SignIn
  TextFormField _buildSigninTextField(
      String labelText, IconData iconData, TextEditingController controllers,
      {bool obscureText = false,
      bool isEmail = false,
      bool isPassword = false}) {
    return TextFormField(
      controller: controllers,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(iconData),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        filled: true,
        fillColor: Colors.grey.shade300,
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

  // Helper function for TextField widgets for SignUp
  TextFormField _buildSignUpTextField(
      String labelText, IconData iconData, TextEditingController controller,
      {bool obscureText = false,
      bool isEmail = false,
      bool isPhone = false,
      bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: Icon(iconData),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          fillColor: Colors.grey.shade300,
          filled: true),
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
}
