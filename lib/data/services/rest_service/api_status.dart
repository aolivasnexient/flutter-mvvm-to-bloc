class Success<T> {
  T response;
  Success({required this.response});
}

class SuccessV2{
  final String response;
  SuccessV2({required this.response});
}

class Failure {
  int code;
  String error;
  Failure({required this.code, required this.error});
}
