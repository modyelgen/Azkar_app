import 'package:audioplayers/audioplayers.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
class MyTimeZone{
  static String?timeZoneName;
  static final player=AudioPlayer();
 static Future<void>timeZoneConfig()async{
    tz.initializeTimeZones();
    timeZoneName=await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }
  tz.TZDateTime scheduleDaily([int? hr,int? min]){
   final tz.TZDateTime now=tz.TZDateTime.now(tz.local);
   tz.TZDateTime scheduleDate=tz.TZDateTime(tz.local, now.year,now.month,now.day,hr!,min!);
   if(scheduleDate.isBefore(now)){
     scheduleDate=scheduleDate.add(const Duration(days: 1));
   }
   return scheduleDate;
  }
}
