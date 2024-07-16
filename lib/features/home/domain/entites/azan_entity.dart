import 'package:hive/hive.dart';
part 'azan_entity.g.dart';
@HiveType(typeId: 0)
class DateTimeEntity extends HiveObject{
  @HiveField(0)
  final String? readableDate;
  @HiveField(1)
  final String? hijriDay;
  @HiveField(2)
  final String? hijriMonth;
  @HiveField(3)
  final String? hijriYear;
  @HiveField(4)
  final Map<String,dynamic>?azanTimes;

  DateTimeEntity({required this.readableDate,required this.hijriDay,required this.hijriYear,required this.hijriMonth,required this.azanTimes});
}