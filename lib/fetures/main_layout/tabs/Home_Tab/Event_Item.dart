import 'package:evently_app/config/language/theme/theme.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/Models/Event_Model.dart';
import 'package:intl/intl.dart';
class EventItem extends StatelessWidget {
   EventItem({super.key,required this.event});
final EventModel event;
List<String>months=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          margin:  REdgeInsets.symmetric(horizontal: 16),
          padding: REdgeInsets.all(8),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(Imagemanger.Meetingphoto),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: Card(
                            child: Padding(
                padding:EdgeInsets.all(8),
                            child: Column(
                children:[
                            Text(
                              event.dataTime.day.toString(),style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 24,color:Colorsmanger.Blue),),
                  Text(
                  months[event.dataTime.month-1],style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 16,color: Colorsmanger.Blue),),
                        ],
                            ),
                ),
                ),
              ),
              Spacer(),
              Card(
               child:  Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.title,style: Theme.of(context).textTheme.titleSmall
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colorsmanger.Blue,))
                  ],
                ),
              ),
              ],
          ),
          ),

      ],
    );

  }
  String getFormattedDate(DateTime dateTime) {
    DateFormat format=DateFormat('yyyy-MM-dd – kk:mm');
    return format.format(dateTime);

  }
}
