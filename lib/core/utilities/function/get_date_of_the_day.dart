import 'package:intl/intl.dart';

String getDateOfTheDay({String formated="yyyy-MM-dd"}){
  DateTime now =DateTime.now();
  DateFormat formatter=DateFormat(formated);
  String formattedDate=formatter.format(now);
  return formattedDate;
}