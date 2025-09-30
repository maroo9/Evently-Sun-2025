import 'package:flutter/material.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}


class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatestate();
  }

  void navigatestate(){
  Future.delayed(Duration(seconds: 2),(){
  Navigator.pushNamed(context, Routesmanger.Onboriding1s);
  }
  );

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsmanger.Whiteblue,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 200,),
        Container(
          width: 200,
            height: 250,
            child: Image(image: AssetImage(Imagemanger.logoimage,),)),
        Spacer(),
        Container(
          width: 200,
          height: 250,
          child: Image(image: AssetImage(Imagemanger.Routephoto,),),
        )



    ],
      ),
        );

  }
}
