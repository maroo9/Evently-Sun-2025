import 'package:evently_app/Models/Event_Model.dart';
import 'package:evently_app/Models/User_Model.dart';
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
import 'package:evently_app/l10n/app_localizations_ar.dart';
import 'package:evently_app/l10n/app_localizations_en.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/Firebase_Servicess/FairebaseServicess.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Tabitem.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;
  List<EventModel> events=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
 getEvents();
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
                    Text(AppLocalizations.of(context)!.welcome_message,style: Theme.of(context).textTheme.headlineSmall,),
                    SizedBox(height: 5,),
                    Text( UserModel.currentUser!.name,style:GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w700),),
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
  catogries: [], oncatogryTapcliced: (CatogryModel ) {  },
),
          ],
              ),
              ),
              ),

             Column(children: [


             events.isEmpty?Center(child: CircularProgressIndicator(),): ListView.separated(
                    itemBuilder: (context,index)=>EventItem(event: events[index],),
                    separatorBuilder: (context,index)=>SizedBox(height: 16,),
                    itemCount: events.length,
                   shrinkWrap: true, // Use shrinkWrap to prevent ListView from taking infinite space
                   physics: NeverScrollableScrollPhysics(),
                 ),
    ],

    ),

            ],

        ),
        ),
      );
  }
  void getEvents()async {
    events= await Fairebaeservices.getEvents(context);
    setState(() {

    });
  }

}

