import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:evently_app/fetures/main_layout/tabs/location_tab/location_tab.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/fetures/Create_event/creata_event.dart';
import 'package:evently_app/fetures/auth/login/login.dart';
import 'package:evently_app/fetures/auth/register/register.dart';
import 'package:evently_app/screens/splashscreen.dart';
import 'package:evently_app/screens/onboriding1.dart';
import 'package:evently_app/screens/onbording2.dart';
abstract class Routesmanger {
  static const String Logins = "/login";
  static const String mainlayout = "/main_layout";
  static const String Registes = "/register";
  static const String CreateEvents = "/CreataEvent";
  static const String Locations = "/LocationTab";
  static const String Splaschreens = "/splashscreen";
  static const String Onboriding1s = "/onboriding1";
  static const String Onboriding12 = "/onboriding2";

  static Map<String, WidgetBuilder> routes={
   Logins: (context)=>Login(),
    Registes:(context)=>Register(),
    mainlayout:(context)=>MainLayout(),
    CreateEvents:(context)=>CreataEvent(),
    Locations:(context)=>LocationTab(),
    Splaschreens:(context)=>Splashscreen(),
    Onboriding1s:(context)=>Onboriding1(),
    Onboriding12:(context)=>onboarding2(),

};

}
