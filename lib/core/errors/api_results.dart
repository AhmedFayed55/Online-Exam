import 'package:online_exam/core/errors/failure.dart';

sealed class Apiresult<T> {}

class ApiSuccessResult<T> extends Apiresult<T> {
  final T data;
  ApiSuccessResult({required this.data});
}

class ApiErrorResult<T> extends Apiresult<T> {
  final Failure failure;
  ApiErrorResult({required this.failure});
}
