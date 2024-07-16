import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:untitled/core/constant.dart';
import 'package:untitled/core/utilities/api_services.dart';

import '../../../../core/utilities/function/get_date_of_the_day.dart';
import '../../domain/entites/azan_entity.dart';
import '../model/new_azan_model.dart';

abstract class HomeRemoteDateSource{
  Future<DateTimeEntity> fetchDateTime({required double latitude,required double longitude});
}
class HomeRemoteDateSourceImp extends HomeRemoteDateSource{
  final ApiServices apiServices;
  Location location=Location();
  late LocationData locationData;
  HomeRemoteDateSourceImp(this.apiServices);
  @override
  Future<DateTimeEntity> fetchDateTime({required double latitude,required double longitude})async {
    String date=getDateOfTheDay(formated: "dd-MM-yyyy");
    var data= await apiServices.get(endPoints:"$date?latitude=$latitude&longitude=$longitude&timezonestring=Africa/Cairo&method=5" );
    await Hive.box<DateTimeEntity>(azanBox).clear();
    DateTimeEntity? entity;
    entity =getDateTime(data);
    saveLocal(entity, azanBox);
    return entity;
  }
  DateTimeEntity getDateTime(Map<String,dynamic>data){
    DateTimeEntity?dateTimeEntity;
    dateTimeEntity=PrayerData.formJson(data['data']);
    return dateTimeEntity;
  }
  void saveLocal(DateTimeEntity entity,String boxName,){
    var box=Hive.box<DateTimeEntity>(boxName);
    box.add(entity);
  }
}
