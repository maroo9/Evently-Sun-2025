import 'package:evently_app/Models/User_Model.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/Firebase_Servicess/FairebaseServicess.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:evently_app/provider/config_provider.dart';

import 'core/Prefsmanger/PrefsManger.dart';
void main() async{

WidgetsFlutterBinding.ensureInitialized();
   await PrefsManger.init();


await  Firebase.initializeApp();
if(FirebaseAuth.instance.currentUser!=null){
  UserModel.currentUser=await Fairebaeservices.getUserId(FirebaseAuth.instance.currentUser!.uid);
}
  runApp(ChangeNotifierProvider(
    create: (context)=>ConfigProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Thememanger.light,
        darkTheme: Thememanger.dark,
        themeMode: configProvider.currenttheme,
        locale: Locale(configProvider.currentlanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // arabic
        ],
      routes: Routesmanger.routes,
      initialRoute: FirebaseAuth.instance.currentUser== null? Routesmanger.Logins:Routesmanger.mainlayout ,
      //
      ),
    );
  }
}