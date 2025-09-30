import 'package:flutter/material.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  static final ThemeData dark=ThemeData(
  useMaterial3: false,

  primaryColor: Colorsmanger.darkblue,
  iconTheme: IconThemeData(color: Colorsmanger.offwhite),
  appBarTheme: AppBarTheme(
  backgroundColor: Colorsmanger.darkblue,
  foregroundColor: Colorsmanger.Blue,
  titleTextStyle: TextStyle(
  fontSize: 22,
  color: Colorsmanger.Blue,
  fontWeight: FontWeight.w400,
  ),
  centerTitle: true,
  ),
  scaffoldBackgroundColor: Colorsmanger.darkblue,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
  backgroundColor: Colors.transparent,
  elevation: 0,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: Colorsmanger.offwhite,
  unselectedItemColor: Colorsmanger.offwhite,
  ),

  bottomAppBarTheme: BottomAppBarTheme(
  color: Colorsmanger.darkblue,
  shape: CircularNotchedRectangle()
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
  backgroundColor: Colorsmanger.darkblue,
  foregroundColor: Colorsmanger.offwhite,
  shape: StadiumBorder(side: BorderSide(color: Colorsmanger.offwhite, width: 4))
  ),
  inputDecorationTheme: InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16.r),
  borderSide: BorderSide(width: 1.w, color: Colorsmanger.Blue),
  ),
  focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16.r),
  borderSide: BorderSide(width: 1.w, color: Colorsmanger.Blue),
  ),
  errorBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16.r),
  borderSide: BorderSide(width: 1.w, color: Colorsmanger.Red),
  ),
  focusedErrorBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16.r),
  borderSide: BorderSide(width: 1.w, color: Colorsmanger.Red),
  ),
  hintStyle: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colorsmanger.offwhite),
  labelStyle: GoogleFonts.inter(
  fontSize: 16.sp,
  color: Colorsmanger.Whiteblue,
  fontWeight: FontWeight.w500,
  ),
  prefixIconColor: Colorsmanger.Whiteblue,
  suffixIconColor: Colorsmanger.Whiteblue
  ),
  cardTheme: CardThemeData(
  color: Colorsmanger.darkblue
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
  padding: REdgeInsets.symmetric(vertical: 16),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(16),
  ),
  backgroundColor: Colorsmanger.Blue,
  foregroundColor: Colorsmanger.Whiteblue,
  )
  ),


  textTheme: TextTheme(
  headlineSmall: GoogleFonts.inter(
  fontSize: 14,
  color: Colorsmanger.Whiteblue,
  fontWeight: FontWeight.w400,
  ),
  headlineMedium: GoogleFonts.inter(
  fontSize: 18,
  color: Colorsmanger.offwhite,
  fontWeight: FontWeight.w500,
  ),
  headlineLarge: GoogleFonts.inter(
  fontSize: 24.sp,
  color: Colorsmanger.Whiteblue,
  fontWeight: FontWeight.bold,
  ),
  labelSmall: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colorsmanger.Blue),
  labelMedium: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colorsmanger.offwhite),
  titleSmall: GoogleFonts.inter(
  fontSize: 14.sp,
  color: Colorsmanger.offwhite,
  fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colorsmanger.offwhite)
  ,bodySmall: GoogleFonts.inter(fontSize: 16.sp,fontWeight: FontWeight.w500, color: Colorsmanger.offwhite)


  )
  );

}