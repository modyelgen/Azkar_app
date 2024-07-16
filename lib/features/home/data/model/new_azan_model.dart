import 'package:untitled/features/home/data/model/timing_model.dart';
import 'package:untitled/features/home/domain/entites/azan_entity.dart';
class PrayerData extends DateTimeEntity{
 final Map<String,dynamic> timing;
 final Date date;
  PrayerData({required this.timing,required this.date}):super(
      hijriYear:date.hijriYear ,
      hijriDay: date.hijriDay,
      hijriMonth: date.hijriMonthEn,
      readableDate: date.readableDate,
      azanTimes:timing,
  );
  factory PrayerData.formJson(Map<String,dynamic>json)=>PrayerData(
      timing: json['timings'],
      date: Date.fromJson(json['date'])
  );
}

// class PrayerTimesResponse {
//   int code;
//   String status;
//   PrayerTimesData data;
//
//   PrayerTimesResponse({
//     required this.code,
//     required this.status,
//     required this.data,
//   });
//
//   factory PrayerTimesResponse.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesResponse(
//       code: json['code'],
//       status: json['status'],
//       data: PrayerTimesData.fromJson(json['data']),
//     );
//   }
// }
// class PrayerTimesData {
//   Map<String, String> timings;
//   PrayerTimesDate date;
//   PrayerTimesMeta meta;
//
//   PrayerTimesData({
//     required this.timings,
//     required this.date,
//     required this.meta,
//   });
//
//   factory PrayerTimesData.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesData(
//       timings: Map<String, String>.from(json['timings']),
//       date: PrayerTimesDate.fromJson(json['date']),
//       meta: PrayerTimesMeta.fromJson(json['meta']),
//     );
//   }
// }
//
// class PrayerTimesDate {
//   String readable;
//   String timestamp;
//   PrayerTimesHijri hijri;
//   PrayerTimesGregorian gregorian;
//
//   PrayerTimesDate({
//     required this.readable,
//     required this.timestamp,
//     required this.hijri,
//     required this.gregorian,
//   });
//
//   factory PrayerTimesDate.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesDate(
//       readable: json['readable'],
//       timestamp: json['timestamp'],
//       hijri: PrayerTimesHijri.fromJson(json['hijri']),
//       gregorian: PrayerTimesGregorian.fromJson(json['gregorian']),
//     );
//   }
// }
//
// class PrayerTimesHijri {
//   String date;
//   String format;
//   String day;
//   PrayerTimesWeekday weekday;
//   PrayerTimesMonth month;
//   String year;
//   PrayerTimesDesignation designation;
//   List<String>? holidays;
//
//   PrayerTimesHijri({
//     required this.date,
//     required this.format,
//     required this.day,
//     required this.weekday,
//     required this.month,
//     required this.year,
//     required this.designation,
//      required this.holidays,
//   });
//
//   factory PrayerTimesHijri.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesHijri(
//       date: json['date'],
//       format: json['format'],
//       day: json['day'],
//       weekday: PrayerTimesWeekday.fromJson(json['weekday']),
//       month: PrayerTimesMonth.fromJson(json['month']),
//       year: json['year'],
//       designation: PrayerTimesDesignation.fromJson(json['designation']),
//       holidays: List<String>.from(json['holidays']).isEmpty?["No holiday"]: List<String>.from(json['holidays']),
//     );
//   }
// }
//
// class PrayerTimesGregorian {
//   String date;
//   String format;
//   String day;
//   PrayerTimesWeekday weekday;
//   PrayerTimesMonth month;
//   String year;
//   PrayerTimesDesignation designation;
//
//   PrayerTimesGregorian({
//     required this.date,
//     required this.format,
//     required this.day,
//     required this.weekday,
//     required this.month,
//     required this.year,
//     required this.designation,
//   });
//
//   factory PrayerTimesGregorian.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesGregorian(
//       date: json['date'],
//       format: json['format'],
//       day: json['day'],
//       weekday: PrayerTimesWeekday.fromJson(json['weekday']),
//       month: PrayerTimesMonth.fromJson(json['month']),
//       year: json['year'],
//       designation: PrayerTimesDesignation.fromJson(json['designation']),
//     );
//   }
// }
//
// class PrayerTimesWeekday {
//   String en;
//
//   PrayerTimesWeekday({
//     required this.en,
//   });
//
//   factory PrayerTimesWeekday.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesWeekday(
//       en: json['en'],
//     );
//   }
// }
//
// class PrayerTimesMonth {
//   int number;
//   String en;
//   String ar;
//
//   PrayerTimesMonth({
//     required this.number,
//     required this.en,
//     required this.ar,
//   });
//
//   factory PrayerTimesMonth.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesMonth(
//       number: json['number'],
//       en: json['en'],
//       ar: json['ar'],
//     );
//   }
// }
//
// class PrayerTimesDesignation {
//   String abbreviated;
//   String expanded;
//
//   PrayerTimesDesignation({
//     required this.abbreviated,
//     required this.expanded,
//   });
//
//   factory PrayerTimesDesignation.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesDesignation(
//       abbreviated: json['abbreviated'],
//       expanded: json['expanded'],
//     );
//   }
// }
//
// class PrayerTimesMeta {
//   double latitude;
//   double longitude;
//   String timezone;
//   PrayerTimesMethod method;
//   String latitudeAdjustmentMethod;
//   String midnightMode;
//   String school;
//   Map<String, int> offset;
//
//   PrayerTimesMeta({
//     required this.latitude,
//     required this.longitude,
//     required this.timezone,
//     required this.method,
//     required this.latitudeAdjustmentMethod,
//     required this.midnightMode,
//     required this.school,
//     required this.offset,
//   });
//
//   factory PrayerTimesMeta.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesMeta(
//       latitude: json['latitude'],
//       longitude: json['longitude'],
//       timezone: json['timezone'],
//       method: PrayerTimesMethod.fromJson(json['method']),
//       latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'],
//       midnightMode: json['midnightMode'],
//       school: json['school'],
//       offset: Map<String, int>.from(json['offset']),
//     );
//   }
// }
//
// class PrayerTimesMethod {
//   int id;
//   String name;
//   PrayerTimesParams params;
//   PrayerTimesLocation location;
//
//   PrayerTimesMethod({
//     required this.id,
//     required this.name,
//     required this.params,
//     required this.location,
//   });
//
//   factory PrayerTimesMethod.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesMethod(
//       id: json['id'],
//       name: json['name'],
//       params: PrayerTimesParams.fromJson(json['params']),
//       location: PrayerTimesLocation.fromJson(json['location']),
//     );
//   }
// }
//
// class PrayerTimesParams {
//   int Fajr;
//   int Isha;
//
//   PrayerTimesParams({
//     required this.Fajr,
//     required this.Isha,
//   });
//
//   factory PrayerTimesParams.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesParams(
//       Fajr: json['Fajr'],
//       Isha: json['Isha'],
//     );
//   }
// }
//
// class PrayerTimesLocation {
//   double latitude;
//   double longitude;
//
//   PrayerTimesLocation({
//     required this.latitude,
//     required this.longitude,
//   });
//
//   factory PrayerTimesLocation.fromJson(Map<String, dynamic> json) {
//     return PrayerTimesLocation(
//       latitude: json['latitude'],
//       longitude: json['longitude'],
//     );
//   }
// }

