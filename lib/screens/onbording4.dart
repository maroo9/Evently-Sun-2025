import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/Assetsmanger/Assetsmangers.dart';
import '../core/Colorsmanger/Colorsmanger.dart';
import '../core/Routesmanger/routesmanger.dart';
class onbording4 extends StatelessWidget {
    onbording4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
              Image(image: AssetImage(Imagemanger.floweimage),width: 48,height: 50,),
              SizedBox(width: 10,),
              Image(image: AssetImage(Imagemanger.Textimage),width: 101,height: 50,),

            ],
          ),
          Image(image: AssetImage(Imagemanger.WomenWithPhone),width: 360,height: 361,)
          ,Text("Connect with Friends & Share Moments",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 20,color: Colorsmanger.Blue,),),
          Text("Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500,color: Colorsmanger.darkblue),),
          SizedBox(height: 44,),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colorsmanger.Blue, // border color
                      width: 2, // border thickness
                    ),
                  ),
                  padding: const EdgeInsets.all(4), // circle size
                  backgroundColor: Colors.transparent, // transparent inside
                  shadowColor: Colors.transparent,
                ),
                onPressed: (){
                  Navigator.pushNamed(context, Routesmanger.Onboriding13);
                }, child: Icon(Icons.arrow_back,color:  Colorsmanger.Blue,
              ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colorsmanger.Blue, // border color
                      width: 2, // border thickness
                    ),
                  ),
                  padding: const EdgeInsets.all(4), // circle size
                  backgroundColor: Colors.transparent, // transparent inside
                  shadowColor: Colors.transparent,
                ),// no shadow
                onPressed: (){
                  Navigator.pushNamed(context, Routesmanger.Logins);
                },  child: Icon(Icons.arrow_forward,color:  Colorsmanger.Blue,),
              ),
            ],
          ),
        ],


      ),

    );
  }
}
