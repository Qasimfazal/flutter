class Resource<T> {
  T data;
  String error;
  Resource({this.data, this.error});
  Resource.success(this.data);
  Resource.error(this.error);
  Resource.loading();

  bool get isLoading => error == null && data == null;
  bool get isSuccess => data != null;
  bool get isError => error != null;
}