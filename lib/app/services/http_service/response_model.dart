class ServiceResponse<T> {
  bool status;
  String? message;
  T? data;

  ServiceResponse({this.data, this.message, required this.status});
}
