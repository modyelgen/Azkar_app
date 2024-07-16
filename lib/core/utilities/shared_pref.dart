import 'package:shared_preferences/shared_preferences.dart';
class CachedDateSharedPreferences{
  static late SharedPreferences prefs;
  static cacheInitialization()async{
    prefs=await SharedPreferences.getInstance();
  }
  Future<void> setValue({required String key,required dynamic value})async{
    if(value is int){
    await prefs.setInt(key, value);
    }
    if(value is double){
      await prefs.setDouble(key, value);
    }
    if(value is String){
      await prefs.setString(key, value);
    }
    if(value is bool){
      await prefs.setBool(key, value);
    }
  }
   dynamic getData({required String key}){
    return prefs.get(key);
  }
}