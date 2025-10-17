import 'package:evently_app/Models/Catogry_model.dart';
import 'package:flutter/material.dart';
class EventModel {
  String eveintid;
  String userid;
  CatogryModel catogryModel;
  String title;
  String description;
  DateTime dataTime;
  TimeOfDay timeOfDay;
  String imagepath;

  EventModel({required this.catogryModel, required this.title, required this.description, required this.dataTime, required this.timeOfDay, required this.imagepath, required this.eveintid, required this.userid});

  EventModel.fromjson(Map<String, dynamic> json,BuildContext context):this(
    eveintid: json["eventId"],
    userid: json["userId"],
    catogryModel:CatogryModel.getCatogries(context).firstWhere((
        CatogryModel)=>CatogryModel.id==json["catogryId"]),
    title: json["title"],
    description: json["description"],
    dataTime: json["dataTime"],
    timeOfDay: json["timeOfDay"],
    imagepath: json["imagepath"],
  );
  /// like we did in the user model   // is to decalre whats type well be in the firebase firestore
  Map<String, dynamic> toJosn() {
    return {
      "eventId" : eveintid,
      "userId" :userid,
      "catogry": catogryModel.id,
      "title": title,
      "description": description,
      "dataTime": dataTime,
    };
  }


}
