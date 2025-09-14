// this made for shortcuts as assets manager and routes manager:
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
class CustomTextForm extends StatelessWidget {
  //  write all the variables  in constartor to be  use it
  CustomTextForm({super.key, required this.labelText,
    this.hintText,
    required this.controller,
     this.prefixIcon,
    this.suffixIcon,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    });
  // makes the variable
  final String? labelText;   // as String "Name"
  final String? hintText;   // as String "Hint name"
  final IconData?prefixIcon; // as (IconData) that holds all icons
  final Widget? suffixIcon;     // as widget to  use  IconButton
  final TextInputType? keyboardType;
  final bool isObscure;
  String? Function(String?)? validator;
  final TextEditingController controller;

 // final bool isSecure;
  //final String? Function(String?) validator;
  //final TextEditingController controller;
  //final int maxLines;

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller:controller ,
      validator: validator,
      obscureText: isObscure,
      keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon:prefixIcon == null? null:Icon(prefixIcon),
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),



      ),
    );
  }
}
