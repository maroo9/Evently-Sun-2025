import 'package:evently_app/Models/Event_Model.dart';
import 'package:evently_app/core/Widget/Custom_tab_bar.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Event_Item.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Tabitem.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/core/Widget/Custom_Elvated button.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/Models/Catogry_model.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Tabitem.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SingleChildScrollView(
      child:   Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r))
               , color: Colorsmanger.Blue,
                ),

                child:SafeArea(
                  child:
                Column(

                   children: [

                  Row(
                    children:[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back ✨",style: Theme.of(context).textTheme.headlineSmall,),
                    SizedBox(height: 5,),
                    Text("Marwan Hazem" ,style:Theme.of(context).textTheme.headlineLarge,),
                    Padding(padding: EdgeInsets.all(8),

                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Icon(Icons.location_on,color: Colorsmanger.Whiteblue,),
                    SizedBox(width: 4,),
                        Text(" CAIRO ,Egypt ✨",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14,color: Colorsmanger.Whiteblue),),
                  ],


                    ),
                    ),
                ],
              ),
Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.sunny,color: Colorsmanger.Whiteblue,),),
                     SizedBox(width: 5,),


                     InkWell(
                       onTap: (){},
                       child: Card(
                         child:Padding(
                             padding:const EdgeInsets.all(8),
                           child: Text("En",style:Theme.of(context).textTheme.bodySmall,),),
                                   ),
                     ),
                  ],


              ),

CustomTabBar(
  bgselecteditem: Colorsmanger.Whiteblue,
  fgselecteditem: Colorsmanger.Blue,
  unbgselecteditem: Colors.transparent,
  unfgselecteditem: Colorsmanger.Whiteblue,
),
          ],
              ),
              ),
              ),
           ListView.separated(
                  itemBuilder: (context,index)=>EventItem(event: EventModel(catogryModel: CatogryModel.Catogries[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", dataTime: DateTime.now(), timeOfDay: TimeOfDay.now(), imagepath: "")),
                  separatorBuilder: (context,index)=>SizedBox(height: 16,),
                  itemCount: 20,
                 shrinkWrap: true, // Use shrinkWrap to prevent ListView from taking infinite space
                 physics: NeverScrollableScrollPhysics(),
               ),

            ],

        ),
        ),
      );
  }
}
