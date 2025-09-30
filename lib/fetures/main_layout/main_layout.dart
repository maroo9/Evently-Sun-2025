import 'package:flutter/material.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Widget/Custom_Elvated button.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:evently_app/fetures/main_layout/tabs/favorite_tab/favorite_tab.dart';
import 'package:evently_app/fetures/main_layout/tabs/Home_Tab/Home_tab.dart';
import 'package:evently_app/fetures/main_layout/tabs/location_tab/location_tab.dart';
import 'package:evently_app/fetures/main_layout/tabs/person_tab/person_tab.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/l10n/app_localizations_en.dart';
import 'package:evently_app/l10n/app_localizations_ar.dart';
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});


  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Widget> tab = [
    HomeTab(),
    LocationTab(),
    FavoriteTab(),
    PersonTab(),
  ];

  int selectedIndex = 0;

  void _onTap(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      extendBody: true,
      body: tab[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routesmanger.CreateEvents);
      },
      child: Icon(Icons.add),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colorsmanger.Whiteblue, width: 4),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      backgroundColor: Colorsmanger.Blue,
      items: [
        BottomNavigationBarItem(icon:  Icon(Icons.home), label: AppLocalizations.of(context)!.home),
         BottomNavigationBarItem(icon: Icon(Icons.location_on), label: AppLocalizations.of(context)! .location),
         BottomNavigationBarItem(icon: Icon(Icons.favorite), label:AppLocalizations.of(context)!.favourite),
         BottomNavigationBarItem(icon: Icon(Icons.person), label: AppLocalizations.of(context)!.profile),
      ],
    );
  }
}
