import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:evently_app/fetures/main_layout/tabs/location_tab/location_tab.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/fetures/Create_event/creata_event.dart';
import 'package:evently_app/fetures/auth/login/login.dart';
import 'package:evently_app/fetures/auth/register/register.dart';
abstract class Routesmanger {
  static const String Logins = "/login";
  static const String mainlayout = "/main_layout";
  static const String Registes = "/register";
  static const String CreateEvents = "/CreataEvent";
  static const String Locations = "/LocationTab";
  static Map<String, WidgetBuilder> routes={
   Logins: (context)=>Login(),
    Registes:(context)=>Register(),
    mainlayout:(context)=>MainLayout(),
    CreateEvents:(context)=>CreataEvent(),
    Locations:(context)=>LocationTab(),
};

}
