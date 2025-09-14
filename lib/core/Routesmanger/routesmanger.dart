import 'package:flutter/material.dart';
import 'package:evently_app/fetures/login/login.dart';
import 'package:evently_app/fetures/register/register.dart';
abstract class Routesmanger {
  static const String Logins = "/login";
  static const String Registes = "/register";
  static Map<String, WidgetBuilder> routes={
   Logins: (context)=>Login(),
    Registes:(context)=>Register(),
};

}
