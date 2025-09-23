import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Widget/Custom_Elvated%20button.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/fetures/main_layout/tabs/person_tab/DropDown.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class PersonTab extends StatelessWidget {
  const PersonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SingleChildScrollView(
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
                  , color: Colorsmanger.Blue,
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Imagemanger.Routelogo,height: 124,width: 124,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Marwan Hazem",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 20,color: Colorsmanger.Whiteblue),),
                        Text("MH@GMAIL.COM",style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 16,color: Colorsmanger.Whiteblue),),



                      ],
                    )
                    ],

                  ),
                  

            ),
                  SizedBox(height: 24,),
                  DropdownItem(label: "Theme", selecteditems: "light", menueitems: ["light","dark","system"]


                  ),
                  SizedBox(height: 16,),
                  DropdownItem(label: "Laungage", selecteditems: "En", menueitems: ["English","Arabic"]
                  ),
                  SizedBox(height: 140,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colorsmanger.Whiteblue,
                    padding: EdgeInsets.all( 16),
                      textStyle: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400)
                    ),onPressed: (){}, child:Row(
                    children: [

                      Icon(Icons.logout),
                      Text("Log Out")
                    ],
                  ) ,)
                ],
        ),

    ),

    );
  }
}
