class DataState<T> {
  T? data;
  DataStateStatus status;

  DataState.Sucess({this.data}) : status = DataStateStatus.sucess;

  DataState.Error() : status = DataStateStatus.error, data = null;
}

enum DataStateStatus {
  sucess,
  error;
}