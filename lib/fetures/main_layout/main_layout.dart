import 'package:flutter/material.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Widget/Custom_Elvated button.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:evently_app/fetures/main_layout/tabs/favorite_tab/favorite_tab.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Home_tab.dart';
import 'package:evently_app/fetures/main_layout/tabs/location_tab/location_tab.dart';
import 'package:evently_app/fetures/main_layout/tabs/person_tab/person_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();

}



class _MainLayoutState extends State<MainLayout> {

  List<Widget>tab=[
    HomeTab(),
    PersonTab(),
    LocationTab(),
    PersonTab(),

  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         

        },
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colorsmanger.Whiteblue,width: 4),
        ),
      ),
      body: tab[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        backgroundColor: Colorsmanger.Blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colorsmanger.Whiteblue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on),label:"location"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label:"favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: "profile"),
        ],
      ),
    );

  }
  void _onTap(int newIndex){
    selectedIndex=newIndex;
    setState(() {

    });

  }
}
