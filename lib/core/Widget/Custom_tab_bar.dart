import 'package:flutter/material.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/Models/Catogry_model.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Tabitem.dart';
class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key,required this.bgselecteditem
    ,required this.unfgselecteditem
    ,required this.unbgselecteditem
    ,required this.fgselecteditem
    ,required this.catogries
    , required this.oncatogryTapcliced

  });
  final List<CatogryModel> catogries;
  final Color bgselecteditem;
  final Color fgselecteditem;
  final Color unbgselecteditem;
  final Color unfgselecteditem;
  final void  Function(CatogryModel)? oncatogryTapcliced;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();

}
int selectedIndex=0;
class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return                      DefaultTabController(
      length: CatogryModel.Catogries.length,
      child: TabBar(
        onTap: (index){
          widget.oncatogryTapcliced?.call(widget.catogries[index]);
          selectedIndex=index;
          setState(() {

          });


        },
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabs:CatogryModel.Catogries.map((catogry) => Tabitem(
            bgselecteditem: widget.bgselecteditem,
            unbgselecteditem: widget.unbgselecteditem,
            fgselecteditem: widget.fgselecteditem,
            unfgselecteditem:widget.unfgselecteditem,

            catogryModel: catogry,
            isSelected:selectedIndex==
                CatogryModel.Catogries.indexOf(catogry)),).toList(),


      ),

    );
  }
}
