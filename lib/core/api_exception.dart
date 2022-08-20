import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError({required DioError dioError}) {
    switch (dioError.type) {
      case DioErrorType.other:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }
  String? message;
  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error["message"] ?? error["success"];
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message']?? "Not found";
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }
}
