import 'package:either_dart/either.dart';
import 'package:location/location.dart';
import 'package:untitled/features/home/domain/entites/azan_entity.dart';
import '../../../../core/errors/handling_errors.dart';

abstract class HomeRepo{
Future<Either<Failure,DateTimeEntity>> fetchPrayerTimes ({required double latitude,required double longitude});
Future<Either<Failure,LocationData>> getUserLocation  ();
}