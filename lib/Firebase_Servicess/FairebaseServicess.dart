import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Fairebaeservices{
  static Future<UserCredential> registers(String email,String password) async{
   UserCredential userCredential=await  FirebaseAuth.instance.createUserWithEmailAndPassword(email:email , password: password);
return userCredential;

  }
  static Future<UserCredential> login(String email,String name) async{
    UserCredential userCredential=await  FirebaseAuth.instance.createUserWithEmailAndPassword(email:email , password: name);
    return userCredential;
  }


}