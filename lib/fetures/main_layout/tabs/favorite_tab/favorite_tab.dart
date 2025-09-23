import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/Models/Event_Model.dart';
import 'package:evently_app/Models/Catogry_model.dart';
import 'package:evently_app/fetures/main_layout/main_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Event_Item.dart';
class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colorsmanger.Whiteblue,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search for Event",
                  hintStyle: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.bold,color: Colorsmanger.Blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),


                ),
              ),
            ),
            SizedBox(height: 16,),
            Expanded(
            child: ListView.separated(
              itemCount: 20,
              separatorBuilder: (context,index)=>SizedBox(height: 16,),
              itemBuilder: (context,index)=>EventItem(event: EventModel(catogryModel: CatogryModel.Catogries[0], title: "Meeting for Updating The Development Method ", description: "Meeting for Updating The Development Method ", dataTime: DateTime.now(), timeOfDay: TimeOfDay.now(), imagepath: "")),

    ),
            ),
          ],
        ),
      ),
    );
  }
}
