import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/Assetsmanger/Assetsmangers.dart';
class onbording3 extends StatelessWidget {
  const onbording3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Image(image: AssetImage(Imagemanger.Womenphoto),width: 360,height: 361,)
,Text("Effortless Event Planning",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 20,color: Colorsmanger.Blue,),),
      Text("Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500,color: Colorsmanger.darkblue),),
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
  Navigator.pushNamed(context, Routesmanger.Onboriding14);
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
      Navigator.pushNamed(context, Routesmanger.Onboriding14);
    },  child: Icon(Icons.arrow_forward,color:  Colorsmanger.Blue,),
    ),
        ],
),
              ],
          

    ),
    );
        }

}