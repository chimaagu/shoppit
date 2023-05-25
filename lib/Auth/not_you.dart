import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/app_colors.dart';
import '../Widgets/reusable_widgets.dart';

class NotYouPage extends StatelessWidget {
  const NotYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 320,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    secondaryColor,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Shoppit",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!  👋🏾",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Phone number, username or email",
                      hintStyle: GoogleFonts.poppins(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, top: 10),
                      child: Text(
                        "Hide password",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  customButton(margin: 0, text: "Reset Password"),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Dont have an account? ",
                          style: GoogleFonts.poppins(color: primaryColor),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, "register");
                            },
                          text: "Register ",
                          style: GoogleFonts.poppins(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.poppins(color: primaryColor),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
