import 'package:flutter/material.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/fetures/register/register.dart';
// its like routes manger and colors manager its storge or blueprint for all pages
class Thememanger{
  static final ThemeData light=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colorsmanger.Whiteblue,
      foregroundColor: Colorsmanger.Blue,
      centerTitle: true,
      titleTextStyle:GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 20,color: Colorsmanger.Blue)

    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w400,color: Colorsmanger.Blue)
    ),
  );
  static final ThemeData dark=ThemeData();
}