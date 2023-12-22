import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/src/error/api_exception.dart';
import 'package:weather_app/src/error/app_exception.dart';

Result<T, Exception> handleError<T>(Object e) {
  if (e is DioException) {
    if (e.response?.data is! Map) {
      return Error(e);
    }

    final errorCode = e.response?.data['errorCode'] as String?;
    if (errorCode == null) {
      return Error(e);
    }

    return Error(APIException(errorCode));
  }

  if (e is TypeError) {
    return const Error(AppException(AppErrorCode.parseError));
  }

  return const Error(AppException(AppErrorCode.unknown));
}
