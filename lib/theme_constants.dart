import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseTheme {
  static TextStyle bodyLg = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 24,
    height: 1.3,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyMd = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 20,
    height: 1.4,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyBase = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyBaseB = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodySm = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 14,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyXs = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
    fontSize: 12,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headingXl = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 36,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headingLg = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 32,
    height: 1.3,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headingMdBold = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 24,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headingMdSemibold = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 24,
    height: 1.4,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headingMd = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 24,
    height: 1.4,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headingSm = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headingSmBold = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.32,
  );
}

abstract class AppColors {
  // light colours
  static const Color colorPrimary = Color(0xFF0BC6B3);
  static const Color colorPrimaryLight = Color(0xFF7EFFE8);
  static const Color colorPrimaryDark = Color(0xFF106A5C);

  // dark colours
  static const Color darkPrimary = Color(0xFF0BC6B3);
  static const Color darkPrimaryLight = Color(0xFF7EFFE8);
  static const Color darkPrimaryDark = Color(0xFF083A33);

  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightBackgroundGrey = Color(0xFFFAFAFA);
  static const Color lightBody = Color(0xFF121212);
  static const Color lightBodyLight = Color(0xFFE5E7EB);
  static const Color lightMuted = Color(0xFF666666);
  static const Color lightBorderGrey = Color(0xFFEBEBEB);
  static const Color lightInputBorderColour = Color(0xFFEAEAEA);

  static const Color darkBackground = Color(0xFF101010);
  static const Color darkBody = Color(0xFFFAFAFA);
  static const Color darkBodyLight = Color(0xFFD9D9D9);
  static const Color darkMuted = Color(0xFF9D9D9D);
  static const Color darkInputBorderColour = Color(0xFF333333);

  static const Color darkPurpleBackground = Color(0xFF0E0217);

  static const Color darkBlueBackground = Color.fromARGB(255, 1, 4, 23);

  static const Color trueBlack = Color(0xFF000000);
}
