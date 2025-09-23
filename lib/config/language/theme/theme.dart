import 'package:flutter/material.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:evently_app/fetures/auth/login/login.dart';
import 'package:evently_app/fetures/auth/register/register.dart';
// its like routes manger and colors manager its storge or blueprint for all pages
class Thememanger{
  static final ThemeData light=ThemeData(
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: Colorsmanger.Whiteblue,
      foregroundColor: Colorsmanger.Blue,
      centerTitle: true,
      titleTextStyle:GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 20,color: Colorsmanger.Blue)

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colorsmanger.Blue,
      foregroundColor: Colorsmanger.Whiteblue,
      shape: StadiumBorder(
        side: BorderSide(color: Colorsmanger.Whiteblue,width: 4),
      )

    ),   //he used it in   main layout  its default   implement when you edit in there theme:
    bottomNavigationBarTheme: BottomNavigationBarThemeData(


        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colorsmanger.Whiteblue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
    ),//  he used it in   main layout as: like made static function that  can use in all files   _buildBottomNavigationBar
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w400,color: Colorsmanger.Blue),
          headlineSmall: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color: Colorsmanger.Whiteblue),
      headlineLarge:  GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 24,color: Colorsmanger.Whiteblue),
      titleSmall: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
      labelMedium: GoogleFonts.inter(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,),
      labelSmall: GoogleFonts.inter(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold,),

    ),

    );
  static final ThemeData dark=ThemeData();
}