import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import '../core/Colorsmanger/Colorsmanger.dart';
import '../core/Widget/Custom_Elvated button.dart';
import '../l10n/app_localizations.dart';
class onboarding2 extends StatelessWidget {
  const onboarding2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    child:  Image(image: AssetImage(Imagemanger.Catsimages),fit: BoxFit.fill,),

    ),
      Spacer(),
      SizedBox(height: 50,),

    ],
    ),
    Text("Find Events That Inspire You",style:GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 20,color: Colorsmanger.Blue)),
    SizedBox(height :28,),
    Text("Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",style:Theme.of(context).textTheme.labelSmall,),
    SizedBox(height: 28,),
    Coustom_Elvated_Button(text: "lets start", onPress: (){
    Navigator.pushNamed(context, Routesmanger.Logins);

    }),

    ],
    ),
    ],
    ),
    );
  }
}
