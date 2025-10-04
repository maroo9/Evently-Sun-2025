import 'package:flutter/material.dart';
import 'package:evently_app/config/resourse/Constant_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PrefsManger{
  static late SharedPreferences prefs;
  static Future<void> init() async{
    prefs=await SharedPreferences.getInstance();
  }
  static void savetheme(ThemeMode thememode) async{
String cureenttheme=thememode ==ThemeMode.light? "light" :"dark";
    prefs.setString(CacheConstant.themekey, cureenttheme);
  }
  static ThemeMode?  getSaveTheme (){
    String? savedTheme = prefs.getString(CacheConstant.themekey);
    if (savedTheme == null) {
      return null;
    }
    else {
      ThemeMode themeMode = savedTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
      return themeMode;
    }
  }

  }
