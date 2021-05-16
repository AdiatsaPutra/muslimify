import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double margin = 16;
const double width = double.infinity;

const primaryColor = Color(0xFFCD0DCB);
const primaryColor2 = Color(0xFFC480DB);
const backgroundColor = Color(0xFFFAFAFA);
const whiteColor = Color(0xFFFFFFFF);
const darkColor = Color(0xFF1F2060);
const blackColor = Color(0xFF1F1F1F);

TextStyle whiteTextRegular = GoogleFonts.poppins(
  textStyle: TextStyle(color: whiteColor, fontSize: 14, height: 1.5),
);
TextStyle whiteTextBold = GoogleFonts.poppins(
  textStyle: TextStyle(
      color: whiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.5),
);
TextStyle darkTextRegular = GoogleFonts.poppins(
  textStyle: TextStyle(color: darkColor, fontSize: 14, height: 1.5),
);
TextStyle darkTextBold = GoogleFonts.poppins(
  textStyle: TextStyle(
      color: darkColor, fontSize: 14, fontWeight: FontWeight.w700, height: 1.5),
);
TextStyle blackTextRegular = GoogleFonts.poppins(
  textStyle: TextStyle(color: blackColor, fontSize: 16, height: 1.5),
);
TextStyle blackTextBold = GoogleFonts.poppins(
  textStyle: TextStyle(
      color: blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.5),
);
