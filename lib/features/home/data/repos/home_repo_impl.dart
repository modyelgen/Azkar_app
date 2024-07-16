import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:untitled/core/errors/handling_errors.dart';
import 'package:untitled/features/home/data/data_source/local_data_source.dart';
import 'package:untitled/features/home/data/data_source/remote_data_source.dart';
import 'package:untitled/features/home/domain/entites/azan_entity.dart';
import 'package:untitled/features/home/domain/repos/home_repo.dart';

class HomeRepoImp extends HomeRepo{
  Location location=Location();
  late LocationData locationData;
  final LocalDateTimeSource localDateTimeSource;
  final HomeRemoteDateSource remoteDateTimeSource;
  HomeRepoImp({required this.localDateTimeSource,required this.remoteDateTimeSource});

  @override
  Future<Either<Failure,LocationData>> getUserLocation()async{

try{
  final locationResult=await location.getLocation();
  locationData= locationResult;
  return Right(locationData);
}
    catch(e){
  if(e is DioException){
    return Left(ServerFailure.fromDioError(e));
  }
  return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DateTimeEntity>> fetchPrayerTimes({required double latitude, required double longitude})async {
    DateTimeEntity? dateTimeEntity;
    DateTime now=DateTime.now();
    String  formattedDate=DateFormat('dd MMM yyyy').format(now);
    try{
       dateTimeEntity= localDateTimeSource.fetchDateTimeLocal();
       if(dateTimeEntity?.readableDate==formattedDate){
         return Right(dateTimeEntity!);
       }
       dateTimeEntity=await remoteDateTimeSource.fetchDateTime(latitude: latitude, longitude: longitude);
      print("fetched remotely");
      return Right(dateTimeEntity);

    }

    catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

}