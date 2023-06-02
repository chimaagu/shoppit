import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/app_colors.dart';

Widget customButton({double? margin, String? text, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: margin!),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.green.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text!,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
