import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:untitled/core/utilities/function/data_location.dart';
import 'package:untitled/core/utilities/function/get_the_coming_prayer.dart';
import 'package:untitled/core/utilities/notification_.dart';
import 'package:untitled/core/utilities/shared_pref.dart';
import 'package:untitled/features/home/domain/entites/azan_entity.dart';
import 'package:untitled/features/home/domain/repos/home_repo.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_states.dart';

import '../../../../../core/constant.dart';

class HomeCubit extends Cubit<HomeState>{
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo):super(InitialHomeState());
  int curIndex=0;
  double? latitude;
   double? longitude;
   bool snake=true;
   bool enable=true;
  Map<String,dynamic>times={};
 final List<String>doaaList=[];
  String? currPrayer;
  Duration? currDuration;
  late Placemark placeMark=Placemark();
 String? place=CachedDateSharedPreferences().getData(key: "place");
   DateTimeEntity? dateTimeEntity;
 int  changeIndex(int index){
    curIndex=index;
    if(curIndex ==0){
      getDuration();
    }
    emit(ChangeNavBarIndex());
    return curIndex;
  }

  Future<void>getUserLocation()async{

    emit(LoadingFetchLocation());
    homeRepo.getUserLocation().then((value) async {
      value.fold((failure) {
        emit(FailureFetchLocation(errMessage: failure.errMessage));
      }, (location) {
        longitude=location.longitude;
        latitude=location.latitude;
        emit(SuccessFetchLocation(locationData: location));
      });
      await fetchPrayerTime();
      place !=null? (){}:getMyPlace();
    }
);

  }

  Future<void>fetchPrayerTime()async{
   emit(LoadingFetchTimes());
     homeRepo.fetchPrayerTimes(longitude: longitude??0,latitude: latitude??0).then((value){
      value.fold((failure) {
        emit(FailureFetchTimes(errMessage: failure.errMessage));
      }, (data) {
        dateTimeEntity=data;
        data.azanTimes?['Midnight']="23:59:59";
        data.azanTimes?.remove('Sunset');
        times=data.azanTimes??{};
       schedulePrayers();
        emit(SuccessFetchTimes(times: data));

      });
      getDuration();
    });
  }

  void schedulePrayers() {
     times.forEach((key, value) async {
      if(basicAzanPrayers.keys.contains(key))
      {
      await MyNotification().scheduledDailyNotification('$key موعد صلاة ','مواقيت الصلاة',hr:int.parse(value.toString().substring(0,2)) ,min:int.parse(value.toString().substring(3,5)) );}
    });
  }
 Future<void> getMyPlace()async{
   emit(LoadingFetchPlace());
    List<Placemark>places=await placemarkFromCoordinates(latitude!, longitude!);
    if(places.isNotEmpty){
     await CachedDateSharedPreferences().setValue(key: "place", value: places.first.subAdministrativeArea);
      emit(SuccessFetchPlace());
    }
    else{
      emit(FailureFetchPlace(errMessage: "cant fetch place"));
    }
   fetchPrayerTime();
    placeMark=places[0];
  }
  Future<List<String>>getDoaaOfTheDay(BuildContext context) async{
   emit(LoadingFetchDoaa());
   DefaultAssetBundle.of(context).loadString(doaaLocation).then((doaa){
     var response=json.decode(doaa);
     response.forEach((section){
       doaaList.add(section['doaa']);
     });
     emit(SuccessFetchDoaa());
     MyNotification().scheduledDailyNotification(doaaList[DateTime.now().day],'دعاء اليوم',hr:12,min:15);
   }).catchError((error){
     emit(FailureFetchDoaa(errMessage: error.toString()));
   });
   return doaaList;
  }

  void getDuration()async{
   emit(LoadingFetchDuration());
   currPrayer=getComingPrayers(times).keys.first;
   emit(SuccessFetchDuration());
   currDuration= getComingPrayers(times).values.first;
   emit(FinishDurationState());
  }

 void showSnaK(){
   snake=!snake;
   emit(ChangeSnaKState());
 }
   void finishDuration(){
   onDoneDuration(currPrayer??"");
   emit(FinishDurationState());
  }
  Future<void> endOfTheDay()async{
   emit(FinishDateToday());
   enable=false;
  await fetchPrayerTime().then((value){
    enable=true;
  });
  }
  void onDoneDuration(String prayer) {
   if(prayer=='Fajr'||prayer=='Asr'){
      MyNotification().scheduledDailyNotification(prayer=='Fajr'?"اذكار الصباح":"اذكار المساء ",'اذكار المسلم',hr: DateTime.now().hour,min: DateTime.now().minute+15);
    }
  }

}