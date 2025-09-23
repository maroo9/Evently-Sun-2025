import 'package:intl/intl.dart';
extension DatetimeEx  on DateTime{
  String getFormattedDate(DateTime dateTime) {
    DateFormat formater=DateFormat('yyyy-MM-dd – kk:mm');
    return formater.format(this);

  }
}