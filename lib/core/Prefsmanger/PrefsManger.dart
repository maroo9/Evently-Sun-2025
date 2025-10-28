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
    String? savedThseme = prefs.getString(CacheConstant.themekey);
    if (savedThseme == null) {
      return null;
    }
    else {
      ThemeMode themeMode = savedThseme == 'light' ? ThemeMode.light : ThemeMode.dark;
      return themeMode;
    }
  }

  }
