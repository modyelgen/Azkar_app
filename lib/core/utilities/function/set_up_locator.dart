import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/core/utilities/api_services.dart';
import 'package:untitled/features/home/data/data_source/local_data_source.dart';
import 'package:untitled/features/home/data/data_source/remote_data_source.dart';
import 'package:untitled/features/home/data/repos/home_repo_impl.dart';
final getIt=GetIt.instance;
void setUp(){
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(
      localDateTimeSource: HomeLocalDateTimeSourceImp(),
      remoteDateTimeSource: HomeRemoteDateSourceImp(
          getIt.get<ApiServices>())));
}