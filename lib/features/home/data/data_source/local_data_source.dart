import 'package:hive/hive.dart';
import 'package:untitled/core/constant.dart';
import 'package:untitled/features/home/domain/entites/azan_entity.dart';

abstract class LocalDateTimeSource {
  DateTimeEntity ?fetchDateTimeLocal();
}
class HomeLocalDateTimeSourceImp extends LocalDateTimeSource{
  @override
  DateTimeEntity fetchDateTimeLocal() {
    var box=Hive.box<DateTimeEntity>(azanBox);
    return box.values.first;
  }
}