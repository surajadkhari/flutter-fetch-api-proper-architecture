import 'package:dio/dio.dart';
import 'package:fetch_api_with_proper_architecure/core/api_const.dart';
import 'package:fetch_api_with_proper_architecure/core/api_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

class ApiClient {
  Future request(
      {required String path,
       String method="get",
      bool isFormData = false,
      Map<String, dynamic> data = const {}}) async {
    Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl, headers: {
      'Content-Type': 'application/json',
      "Accept": 'application/json',
    }));
    try {
      final response = method == "get"
          ? await dio.get(path)
          : await dio.post(path,
              data: isFormData ? FormData.fromMap(data) : data);
      return response.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(dioError: e);
    }
  }
}
