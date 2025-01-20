import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class apptext {
  static TextStyle boldtextfeildstyle() {
    return TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    );
  }

  static TextStyle headtextfeildstyle() {
    return TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
    );
  }

  static TextStyle lighttextfeildstyle() {
    return TextStyle(
      color: const Color.fromARGB(134, 0, 0, 0),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 15.0,
    );
  }

  static TextStyle semiboldtextfeildstyle() {
    return TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    );
  }
}
