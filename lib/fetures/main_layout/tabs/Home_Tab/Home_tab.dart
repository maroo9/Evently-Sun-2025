import 'package:flutter/material.dart';
import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/core/Widget/Custom_Elvated button.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          decoration: BoxDecoration(
           // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          color: Colorsmanger.Blue,
          ),

          child: Row(
            children: [
              Text("Welcome Back ✨",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14),)
            //IconButton(onPressed: (){}, icon: Icon(Imagemanger.GoogleIcon),)
            ],



        )
        ),
      ],
    );
  }
}
