import 'package:flutter/material.dart';
/// this is the  config provider that make to change the  app theme and language theme
class ConfigProvider extends ChangeNotifier{
  ThemeMode currenttheme=ThemeMode.light;
  String currentlanguage="en";
  bool get isDarkEnabled=> currenttheme == ThemeMode.dark;
  bool get isEnglishEnabled=> currentlanguage == "en";

  void changeTheme(ThemeMode newtheme) {
  if (currenttheme == newtheme) return;
  currenttheme = newtheme;
  notifyListeners();

}
  void changeLanguage(String newlanguage){
    if (currentlanguage==newlanguage)return ;
    currentlanguage=newlanguage;
    notifyListeners();

  }

}
