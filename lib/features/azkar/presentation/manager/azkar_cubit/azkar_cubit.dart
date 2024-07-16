import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/utilities/function/data_location.dart';
import 'package:untitled/features/azkar/data/model/azkar_model.dart';
import 'package:untitled/features/azkar/presentation/manager/azkar_cubit/azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState>{
  AzkarCubit():super(InitialFetchAzkarState());

bool show =true;
  late List<AzkarModel>?azkarList=[];
  Future<List<AzkarModel>>getAzkar(BuildContext context)async{
    emit(LoadingFetchAzkarState());
    DefaultAssetBundle.of(context).loadString(azkarLocation).then((data) {
      var response=json.decode(data);
      response.forEach((value){
        azkarList?.add(AzkarModel.fromJson(value));
      });
      emit(SuccessFetchAzkarState());
    }).catchError((error){
      emit(FailureFetchAzkarState(error.toString()));
    });

    return azkarList??[];
  }
  int reduceCount(int count){
    --count;
    emit(MinusAzkarCounterState());
    return count;
  }
  void removeCounter(){
    emit(RemoveCounterState());
  }
  void showFinishing(int length){
    if(length ==0){
      show=!show;
      emit(FinishAzkarState());
    }
  }

}