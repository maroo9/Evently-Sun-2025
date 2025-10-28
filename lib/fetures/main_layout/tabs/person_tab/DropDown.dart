import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
class DropdownItem extends StatelessWidget {
  const DropdownItem({super.key,required this.label,required this.selecteditems,required this.menueitems,required this.onChanged});
  final String label;
  final String selecteditems;
  final List<String> menueitems;
   final void Function (String?) onChanged;


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:SingleChildScrollView(
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            Text(label,style: Theme.of(context).textTheme.labelMedium,),
            SizedBox(height: 16,),
            Container(
              height: 100,
              padding: REdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colorsmanger.Blue,width: 1)
              ),
              child: Row(
                children: [
                  Text(selecteditems,style: Theme.of(context).textTheme.labelMedium,),
                  Spacer(),
                  DropdownButton<String>(

                    items: menueitems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),




                ],

              ),

            ),

          ],
        ),

      ),

    );();
  }
}
