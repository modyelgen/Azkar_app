class AzkarState{}
class InitialFetchAzkarState extends AzkarState {}
class LoadingFetchAzkarState extends AzkarState {}
class SuccessFetchAzkarState extends AzkarState {}
class FailureFetchAzkarState extends AzkarState {
  final String errMessage;
  FailureFetchAzkarState(this.errMessage);
}
class MinusAzkarCounterState extends AzkarState{}
class RemoveCounterState extends AzkarState{}
class FinishAzkarState extends AzkarState{}