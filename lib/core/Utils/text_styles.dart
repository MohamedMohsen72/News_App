
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextTitle({Color color =Colors.white,double fontSize=24,FontWeight fontWeight=FontWeight.normal}){
  return
      TextStyle(
        color: color,
        fontSize: fontSize,
          fontWeight: fontWeight,
        fontFamily:GoogleFonts.poppins().fontFamily
      );
}
TextStyle getTextbady({Color color =Colors.white,double fontSize=18,FontWeight fontWeight=FontWeight.normal}){
  return
    TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily:GoogleFonts.poppins().fontFamily
    );
}
TextStyle getTextsmall({Color color =Colors.grey,double fontSize=16,FontWeight fontWeight=FontWeight.normal}){
  return
    TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily:GoogleFonts.poppins().fontFamily
    );
}