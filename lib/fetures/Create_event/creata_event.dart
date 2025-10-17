import 'package:evently_app/Firebase_Servicess/FairebaseServicess.dart';
import 'package:evently_app/Models/Catogry_model.dart';
import 'package:evently_app/Models/Event_Model.dart';
import 'package:evently_app/Models/User_Model.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Uitiles/Uiutills.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/core/extension/eventtime.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/Widget/Custom_Elvated button.dart';
import 'package:evently_app/core/Widget/Custom_tab_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../l10n/app_localizations.dart';

class CreataEvent extends StatefulWidget {
  const CreataEvent({super.key});

  @override
  State<CreataEvent> createState() => _CreataEventState();
}
DateTime selectedDate = DateTime.now();
TimeOfDay selectedTime = TimeOfDay.now();
CatogryModel selcetedcatogry=CatogryModel.Catogries[0];
var formKey = GlobalKey<FormState>();
class _CreataEventState extends State<CreataEvent> {
  late final TextEditingController _titlecontroller;
  late final TextEditingController _descriptioncontroller;
late  CatogryModel selcetedcatogry=CatogryModel.Catogries[0];

  DateTime selectedDate = DateTime.now();

  void initState() {
    super.initState();
    _titlecontroller = TextEditingController();
    _descriptioncontroller = TextEditingController();
    selcetedcatogry=CatogryModel.Catogries[0];
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorsmanger.Whiteblue,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.create_event),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Imagemanger.Meetingphoto),
            CustomTabBar(
              oncatogryTapcliced: (catogry){
                selcetedcatogry=catogry;
              },
              catogries:CatogryModel.Catogries,
              bgselecteditem: Colorsmanger.Blue,
              fgselecteditem: Colorsmanger.Whiteblue,
              unbgselecteditem: Colors.transparent,
              unfgselecteditem: Colorsmanger.Blue,),
            SizedBox(height: 16,),
            Text(AppLocalizations.of(context)!.title, style: Theme
                .of(context)
                .textTheme
                .titleSmall),
            CustomTextForm(labelText: AppLocalizations.of(context)!.event_title,
                hintText: "Enter Event Title",
                prefixIcon: Icons.edit_note_outlined,
                controller: _titlecontroller,
                validator: (input) {}),
            SizedBox(height: 16,),
            Text(AppLocalizations.of(context)!.description, style: Theme
                .of(context)
                .textTheme
                .titleSmall),
            CustomTextForm(Lines: 5,
                labelText: "Event Description",
                hintText: "Enter Event Title",
                controller: _descriptioncontroller,
                validator: (input) {}),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.calendar_month,),
                Text("${selectedDate.year}-${selectedDate.month}-${selectedDate.day}", style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall,),
                Spacer(),
                CustomTextButton(texts: "Choose Date", onTap: _selectEventDate),
                Spacer(),

                SizedBox(height: 18,),

              ],
            ),
            Row(
              children: [
                Icon(Icons.timelapse_outlined,),
                Text("${selectedTime.hour}:${selectedTime.minute}", style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall,),
                Spacer(),
                CustomTextButton(texts: "Choose Time", onTap: _selectEventTime),
                SizedBox(height: 18,),

              ],
            ),

            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colorsmanger.Whiteblue,
              ),
              child: Expanded(child:
              Coustom_Elvated_Button(text: AppLocalizations.of(context)!.add_event,
                  onPress: _createEevent)),
            )
          ],
        )
    );
  }

  void _selectEventDate()async {
    selectedDate = await  showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)))
        ?? selectedDate;
    print(selectedDate.toString());
    setState(() {

    });
  }


  void _selectEventTime() async {
    selectedTime=
    await showTimePicker(context: context, initialTime: TimeOfDay.now())
        ?? selectedTime;
        selectedDate = selectedDate.copyWith(hour: selectedTime.hour, minute: selectedTime.minute);
    setState(() {

    });

    }

    void _createEevent()async{
    EventModel event=EventModel(
      catogryModel:selcetedcatogry,
        title:_titlecontroller.text ,
        description: _descriptioncontroller.text,
        dataTime:selectedDate,
        timeOfDay: selectedTime,
        imagepath: "",
        eveintid: "",
        userid: UserModel.currentUser!.id);
    uitils.ShowLoading(context);
    await  Fairebaeservices.AddeventtoFirestore(event, context);
    uitils.hideDialog(context);
    uitils.ShowToastMassage("Eventcreated succfully", Colors.green);
    Navigator.pop(context, );

    }

  }

// Coustom_Elvated_Button(text: "Choose date", onPress: (){
// For making calender:
//   showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
// }),


//   Text("Event Title",style: Theme.of(context).textTheme.titleSmall),
//   SizedBox(height: 8,),
//   TextField(
//     decoration: InputDecoration(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       hint: Text("Enter Event Title"),
//       prefixIcon: Icon(Icons.edit_note_outlined),
//     ),
//
//
//
//   ),
//   SizedBox(height: 16,),
//
//   Text("Description",style: Theme.of(context).textTheme.titleSmall),
//
//   SizedBox(
//     width: 361,
//     height: 127,
//     child: TextField(
//   decoration: InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(16),
//     ),
//
//     hint: Text("Enter Event Title"),
//   ),
// ),
//   ),
//


