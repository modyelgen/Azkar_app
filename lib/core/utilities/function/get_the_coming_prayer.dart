import 'package:intl/intl.dart';
import 'package:untitled/core/utilities/function/get_date_of_the_day.dart';

Map<String,Duration>getComingPrayers(Map<String,dynamic>times){
  DateTime now = DateTime.now();

  String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
DateTime formatNow=DateTime.parse(formattedDateTime);

  String dateOfDay=getDateOfTheDay();
  Map<String,dynamic>alt={};
  times.forEach((key, value) {
    alt[key]='$dateOfDay $value';
  });
  DateTime?upcomingTime;
  List<Duration>durations=[];
  List<String>comingPrayers=[];
  Map<String,Duration>prayerTimes={};
  for(String key in alt.keys){
    DateTime time =DateTime.parse(alt[key]);
    if(time.isAfter(formatNow)){
      upcomingTime=time;
    }
    if(upcomingTime!=null){
      durations.add(upcomingTime.difference(formatNow));
      comingPrayers.add(key);
    }
  }
  for(int i=0;i<durations.length;i++){
    prayerTimes[comingPrayers[i]]=durations[i];
  }
  return prayerTimes;
}