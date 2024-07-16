import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/utilities/shared_pref.dart';
import 'package:untitled/features/seb7a/data/manager/sebha_state.dart';
class SebhaCubit extends Cubit<SebhaState>{
   SebhaCubit(this.prefs):super(InitialSebhaState());
   final CachedDateSharedPreferences prefs;
   late int counter=prefs.getData(key: "newCounter")??100;
   late double percent=prefs.getData(key: "percent")??1;
   late bool enable=prefs.getData(key: "enable")??true;
   void changeCounter()async{
   counter=counter-1;
  await prefs.setValue(key: "newCounter", value: counter);
    emit(MinusSebhaCounter());
  }
  void changePercent()async{
    percent=percent-0.01;
    await prefs.setValue(key: "percent", value: percent);
    emit(MinusPercentState());

  }
  void resetCounter()async{
    counter=100;
    percent=1;
    await prefs.setValue(key: "newCounter", value: counter);
    await prefs.setValue(key: "percent", value: percent);
    emit(ResetSebhaCounter());
  }
  void cancelVoice()async{
     enable=!enable;
     await prefs.setValue(key: "enable", value: enable);
    emit(ChangeVoiceState());
  }
}