import 'package:evently_app/Models/Catogry_model.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Tabitem extends StatelessWidget {
  const Tabitem({super.key,required this.bgselecteditem,required this.unfgselecteditem,required this.isSelected,required this.unbgselecteditem,required this.fgselecteditem,required this.catogryModel});
  final Color bgselecteditem;
  final Color fgselecteditem;
  final Color unbgselecteditem;
  final Color unfgselecteditem;
  final bool isSelected;
  final CatogryModel catogryModel;


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: REdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:bgselecteditem,width: 1),
        color:  isSelected?bgselecteditem:unbgselecteditem,

      ),
      child:  Row(
        children: [                        //   if            true       false
          Icon(catogryModel.iconData,color: isSelected?fgselecteditem:unfgselecteditem,),
          SizedBox(width: 8,),
          Text(catogryModel.name,style: GoogleFonts.inter(color: isSelected?fgselecteditem:unfgselecteditem,fontSize: 16,fontWeight: FontWeight.w500),),

        ],
      ),

    );
  }
}
