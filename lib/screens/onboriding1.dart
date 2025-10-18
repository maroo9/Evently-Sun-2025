import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/core/Widget/Custom_Elvated button.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
class Onboriding1 extends StatelessWidget {
   Onboriding1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            Image(image: AssetImage(Imagemanger.floweimage),),
            SizedBox(width: 10,),
            Image(image: AssetImage(Imagemanger.Textimage),),


          ],

      ),
          SizedBox(height: 20,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

              Container(
                width: 361,
          height: 361,
          child:  Image(image: AssetImage(Imagemanger.Bigimages),fit: BoxFit.fill,),

              ),
    ],
              ),
              SizedBox(height: 28,),
              Text("Personalize Your Experience",style:GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 20,color: Colorsmanger.Blue)),
              SizedBox(height :28,),
              Text("Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",style:Theme.of(context).textTheme.labelSmall,),
              SizedBox(height: 28,),
              Row(
                children: [

                  Text(AppLocalizations.of(context)!.language, style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Image(image: AssetImage(Imagemanger.Egyptflags))),
                  IconButton(onPressed: (){}, icon: Image(image: AssetImage(Imagemanger.Espaniatflag)))
                 , SizedBox(height: 18,),


                ],
              ),
              Row(
                children: [

                  Text(AppLocalizations.of(context)!.theme, style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.sunny)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.nightlight_round)),
                  SizedBox(height: 18,),


],
    ),
        Coustom_Elvated_Button(text: "lets start", onPress: (){
          Navigator.pushNamed(context, Routesmanger.Onboriding12);

        }),






                ],
    ),
            ],
          ),

      
    );
  }
}
