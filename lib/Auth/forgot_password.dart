import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/Colors/app_colors.dart';
import 'package:new_app/Widgets/reusable_widgets.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 400,
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
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Your email address goes here",
                    style: GoogleFonts.poppins(),
                  ),
                  const TextField(
                    decoration: InputDecoration(),
                  ),
                  const SizedBox(height: 30),
                  customButton(margin: 0, text: "Reset Password"),
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(color: primaryColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
