import '../../constant.dart';

Map<String,dynamic>getBasicPrayers(Map<String,dynamic>allPrayers){

  Map<String,dynamic> similarValues = {};
  for(String key in allPrayers.keys){
    if(basicPrayers.containsKey(key)){
      similarValues[key]=allPrayers[key];
    }
  }

  return similarValues;
}