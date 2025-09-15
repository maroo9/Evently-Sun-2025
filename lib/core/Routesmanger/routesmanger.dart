import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/fetures/auth/login/login.dart';
import 'package:evently_app/fetures/auth/register/register.dart';
abstract class Routesmanger {
  static const String Logins = "/login";
  static const String mainlayout = "/main_layout";
  static const String Registes = "/register";
  static Map<String, WidgetBuilder> routes={
   Logins: (context)=>Login(),
    Registes:(context)=>Register(),
    mainlayout:(context)=>MainLayout(),
};

}
