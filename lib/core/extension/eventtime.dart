import 'package:intl/intl.dart';
extension DatetimeEx  on DateTime{
  String get FormattedDate {
    DateFormat formater=DateFormat('yyyy-MM-dd – kk:mm');
    return formater.format(this);

  }
}