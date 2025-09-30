import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/l10n/app_localizations.dart';
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

class _CreataEventState extends State<CreataEvent> {
  late final TextEditingController _textcontroller;
  late final TextEditingController _descriptioncontroller;

  void initState() {
    super.initState();
    _textcontroller = TextEditingController();
    _descriptioncontroller = TextEditingController();
  }

  @override
  void dispose() {
    _textcontroller.dispose();
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
            CustomTabBar(bgselecteditem: Colorsmanger.Blue,
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
                controller: _textcontroller,
                validator: (input) {}),
            SizedBox(height: 16,),
            Text(AppLocalizations.of(context)!.description, style: Theme
                .of(context)
                .textTheme
                .titleSmall),
            CustomTextForm(Lines: 5,
                labelText: "Event Description",
                hintText: "Enter Event Title",
                controller: _textcontroller,
                validator: (input) {}),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.calendar_month,),
                Text(AppLocalizations.of(context)!.event_date, style: Theme
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
                Text(AppLocalizations.of(context)!.choose_time, style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall,),
                Spacer(),
                CustomTextButton(texts: "Choose Time", onTap: _selectEventTime),
                SizedBox(height: 18,),

              ],
            ),
            Text(AppLocalizations.of(context)!.location, style: Theme
                .of(context)
                .textTheme
                .labelMedium,),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colorsmanger.Whiteblue,
              ),
              child: CustomTextButton(texts: "Choose Location", onTap: () {
                Navigator.pushNamed(context, Routesmanger.Locations);
              }),
            )
          ],
        )
    );
  }

  void _selectEventDate() async {
    selectedDate = await showDatePicker(context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))) ?? selectedDate;
    print(selectedDate.toString());
    selectedDate = selectedDate.copyWith(
        hour: selectedTime.hour, minute: selectedTime.minute);
    setState(() {

    });
  }

  void _selectEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            selectedTime;
    selectedDate = selectedDate.copyWith(
        hour: selectedTime.hour, minute: selectedTime.minute);


    setState(() {

    });
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

}
