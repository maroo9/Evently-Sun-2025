import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
class CatogryModel{
  String name;
  String id;
  IconData iconData;
  String iamgepath;
  CatogryModel({required this.name,required this.id,required this.iconData, required this.iamgepath});
  static List<CatogryModel>  Catogries = [
  CatogryModel(name: "all", id: "0", iconData: Icons.all_inclusive,iamgepath: ""),
  CatogryModel(name: "Sports", id: "0", iconData: Icons.sports,iamgepath: ""),
  CatogryModel(name: "Birthday", id: "0", iconData: Icons.cake,iamgepath: ""),
  CatogryModel(name: "meeting", id: "0", iconData: Icons.laptop,iamgepath: ""),
  CatogryModel(name: "Gaming", id: "0", iconData: Icons.gamepad,iamgepath: ""),
  CatogryModel(name: "Eating", id: "0", iconData: Icons.local_pizza,iamgepath: ""),
  CatogryModel(name: "Holiday", id: "0", iconData: Icons.holiday_village_rounded,iamgepath: ""),
  CatogryModel(name: "Workshop", id: "0", iconData: Icons.workspaces,iamgepath: ""),
  CatogryModel(name: "Book", id: "0", iconData: Icons.book,iamgepath: ""),
];
  static List<CatogryModel> getCatogries(BuildContext context ){
    return[
    CatogryModel(name:     AppLocalizations.of(context)!.all, id: "0", iconData: Icons.all_inclusive,iamgepath: ""),
    CatogryModel(name:   AppLocalizations.of(context)!.sports, id: "1", iconData: Icons.sports,iamgepath: ""),
    CatogryModel(name:   AppLocalizations.of(context)!.birthday, id: "2", iconData: Icons.cake,iamgepath: ""),
    CatogryModel(name:   AppLocalizations.of(context)!.meeting, id: "3", iconData: Icons.laptop,iamgepath: ""),
    CatogryModel(name:   AppLocalizations.of(context)!.gaming, id: "4", iconData: Icons.gamepad,iamgepath: ""),
    CatogryModel(name:   AppLocalizations.of(context)!.eating, id: "5", iconData: Icons.local_pizza,iamgepath: ""),
    CatogryModel(name:  AppLocalizations.of(context)!.holiday, id: "6", iconData: Icons.holiday_village_rounded,iamgepath: ""),
    CatogryModel(name:   AppLocalizations.of(context)!.workshop, id: "7", iconData: Icons.workspaces,iamgepath: ""),
    CatogryModel(name:   AppLocalizations.of(context)!.bookclub, id: "8", iconData: Icons.book,iamgepath: ""),
  ];

  }
}