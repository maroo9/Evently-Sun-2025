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

  EventModel({
    required this.catogryModel,
    required this.title,
    required this.description,
    required this.dataTime,
    required this.timeOfDay,
    required this.imagepath,
    required this.eveintid,
    required this.userid,
  });

  /// ✅ From Firestore → Dart object
  EventModel.fromjson(Map<String, dynamic> json, BuildContext context)
      : this(
    eveintid: json["eventid"],
    userid: json["userid"],
    catogryModel: CatogryModel.getCatogries(context).firstWhere(
            (cat) => cat.id == json["catogryid"],
        orElse: () => CatogryModel.getCatogries(context).first),
    title: json["title"],
    description: json["description"],
    dataTime: json["dataTime"].toDate(),
    timeOfDay: _parseTimeOfDay(json["timeOfDay"]),
    imagepath: json["imagepath"],
  );

  /// ✅ Dart object → Firestore map
  Map<String, dynamic> toJosn() {
    return {
      "eventid": eveintid,
      "userid": userid,
      "catogryid": catogryModel.id, // ✅ now matches fromjson
      "title": title,
      "description": description,
      "dataTime": dataTime,
      "timeOfDay": "${timeOfDay.hour}:${timeOfDay.minute}", // ✅ store readable format
      "imagepath": imagepath,
    };
  }

  /// helper to parse TimeOfDay from string
  static TimeOfDay _parseTimeOfDay(dynamic value) {
    if (value is TimeOfDay) return value;
    if (value is String) {
      final parts = value.split(":");
      if (parts.length == 2) {
        return TimeOfDay(
            hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      }
    }
    return const TimeOfDay(hour: 0, minute: 0);
  }
}
