import 'package:flutter/material.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Thememanger.light,
        darkTheme: Thememanger.dark,
        themeMode: ThemeMode.dark,
        locale: Locale("en"),
      routes: Routesmanger.routes,
      initialRoute: Routesmanger.mainlayout,
      
      ),
    );
  }
}