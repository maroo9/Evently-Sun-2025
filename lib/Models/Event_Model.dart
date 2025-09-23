import 'package:evently_app/Models/Catogry_model.dart';
import 'package:flutter/material.dart';
class EventModel{
  CatogryModel catogryModel;
  String title;
  String description;
  DateTime dataTime;
  TimeOfDay timeOfDay;
  String imagepath;
  EventModel({required this.catogryModel,required this.title,required this.description,required this.dataTime,required this.timeOfDay,required this.imagepath});



}