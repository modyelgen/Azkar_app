import 'package:location/location.dart';
import 'package:untitled/features/home/domain/entites/azan_entity.dart';

abstract class HomeState{}
class InitialHomeState extends HomeState {}
class ChangeNavBarIndex extends HomeState {}
class LoadingFetchTimes extends HomeState {}
class FailureFetchTimes extends HomeState {
  final String errMessage;
  FailureFetchTimes({required this.errMessage});
}
class SuccessFetchTimes extends HomeState {
  final DateTimeEntity times;
  SuccessFetchTimes({required this.times});
}

class LoadingFetchLocation extends HomeState {}
class FailureFetchLocation extends HomeState {
  final String errMessage;
  FailureFetchLocation({required this.errMessage});
}
class SuccessFetchLocation extends HomeState {
  final LocationData locationData;
  SuccessFetchLocation({required this.locationData});
}
class LoadingFetchDoaa extends HomeState {}
class FailureFetchDoaa extends HomeState {
  final String errMessage;
  FailureFetchDoaa({required this.errMessage});
}
class SuccessFetchDoaa extends HomeState {}
class LoadingFetchPlace extends HomeState {}
class FailureFetchPlace extends HomeState {
  final String errMessage;
  FailureFetchPlace({required this.errMessage});
}
class SuccessFetchPlace extends HomeState {}
class LoadingFetchDuration extends HomeState {}
class SuccessFetchDuration extends HomeState {}
class FailureFetchDuration extends HomeState {
  final String errMessage;
  FailureFetchDuration({required this.errMessage});
}
class FinishDurationState extends HomeState{}
class GetDurationState extends HomeState{}
class ChangeSnaKState extends HomeState{}
class FinishDateToday extends HomeState {}