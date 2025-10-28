import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/Models/Event_Model.dart';
import 'package:flutter/animation.dart';
import 'package:evently_app/Models/User_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Fairebaeservices {
  static Future<UserCredential> registers(String email, String password) async {
    /// this way to make the  user to Register  using the  sign in user and password by firebase  by user and password
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> login(String email, String password) async {
    /// this way to make the  user to login using the  sign in user and password by firebase  by user and password
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static addUasertoFireStore(UserModel user) {
    ///>>>>> this normal  way to create  the collection  to firestore that store or reserve the place like: the id and the name and email
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // // CollectionReference <Map<String, dynamic>> usercollection = db.collection(
    // //     "users");
    // // DocumentReference <Map<String, dynamic>> UserDocument = usercollection.doc(
    // //     user.id);
    ///>>>>> this another way way to create  the collection(by using with  in  class user model model)  to firestore that store the id and the name and email
    FirebaseFirestore db=FirebaseFirestore.instance;
    CollectionReference<UserModel> usercollection = db.collection("Users").withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromjson(snapshot.data()!),
      toFirestore: (user, _) => user.toJosn(),
    );
    DocumentReference<UserModel> UserDocument = usercollection.doc(user.id);
    return UserDocument.set(user);
    UserModel.fromjson(user.toJosn());// this is like this>>>>>>>>>>>>>>>>>>>>>>>>
    // UserDocument.set({
    //   "name": user.name,
    //   "email": user.email,
    //   "id": user.id,
    //
    // });


  }
  static  getUserId(String id)async{
    ///>>>>>>>>> this is  way to get  the user id and details: where in id
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     CollectionReference <Map<String, dynamic>> usercollection = db.collection("Users");
//     DocumentReference <Map<String, dynamic>> UserDocument = usercollection.doc(id);
// DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await  UserDocument.get();
// var jason= documentSnapshot.data();
    // return UserModel(name: jason?['name'], email: jason?["email"], id: jason?["id"]);
    ///>>>>>>>>> this is another way to get  the user id and details: of the
    FirebaseFirestore db=FirebaseFirestore.instance;
    CollectionReference<UserModel> usercollection = db.collection("Users").withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromjson(snapshot.data()!),
      toFirestore: (user, _) => user.toJosn(),
    );
    DocumentReference<UserModel> UserDocument = usercollection.doc(id);
    DocumentSnapshot<UserModel> documentSnapshot = await  UserDocument.get();
    return  documentSnapshot.data();

  }
  /// its the same way but he make a function as a short cut
  static CollectionReference<EventModel> getEventCollection(BuildContext context){
    FirebaseFirestore db=FirebaseFirestore.instance;  /// this mean now we have object of data base
    CollectionReference<EventModel>eventscollection= db.collection("Events").withConverter<EventModel>(
        fromFirestore: (snapshot,_)=>EventModel.fromjson(snapshot.data()!,context),
        toFirestore: (event, _ )=>event.toJosn()); /// now we json craete  the collection  with   rooms or reserved  places
    return  eventscollection;
  }

  /// // its the same way to add the  id and title and discription to firestore
  static Future<void> AddeventtoFirestore(EventModel event,BuildContext context){
    CollectionReference <EventModel>eventcollection=getEventCollection(context);
    /// its the  normal way  to  craeate the collection and add the data to fire store
//     FirebaseFirestore db=FirebaseFirestore.instance;  /// this mean now we have object of data base
// CollectionReference<EventModel>eventscollection= db.collection("Events").withConverter<EventModel>(
//     fromFirestore: (snapshot,_)=>EventModel.fromjson(snapshot.data()!,context),
//     toFirestore: (event, _ )=>event.toJosn()); /// now we json craete  the collection  with   rommse or reservied  places
// eventscollection.doc();
    DocumentReference<EventModel> eventdocument=eventcollection.doc();
    event.eveintid=eventdocument.id;
    return eventdocument.set(event);
  }



  /// to return what the events in that last craeated collection
  static Future<List<EventModel>> getEvents(BuildContext context)async{
    CollectionReference <EventModel>eventcollection=getEventCollection(context);
    QuerySnapshot<EventModel> querySnapshot=await eventcollection.get();
    List<EventModel>events=
    querySnapshot.docs.map((documnetSnapshot) => documnetSnapshot.data()).toList();
    return events;

  }
}
