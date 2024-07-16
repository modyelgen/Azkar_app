import 'package:dio/dio.dart';
class ApiServices{
  final _baseUrl='http://api.aladhan.com/v1/timings/';
  final Dio _dio;
  ApiServices(this._dio);
  Future<Map<String,dynamic>>get({required String endPoints})async{
    var response=await _dio.get('$_baseUrl$endPoints');
    return response.data;
  }

}
