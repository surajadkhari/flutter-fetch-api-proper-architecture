import 'package:fetch_api_with_proper_architecure/core/api_client.dart';
import 'package:fetch_api_with_proper_architecure/core/api_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_response_model.dart';

final postDataSourceProvider = Provider<PostDataSource>((ref) {
  return PostDataSourceImpl(ref.watch(apiProvider));
});

abstract class PostDataSource {
  Future<List<PostResponseModel>> getPost();
}

class PostDataSourceImpl implements PostDataSource {
  final ApiClient _apiClient;
  PostDataSourceImpl(this._apiClient);
  @override
  Future<List<PostResponseModel>> getPost() async {
    final result = await _apiClient.request(
      path: ApiConstant.users,
    );
    final List data = result["data"];
    return data.map((e) => PostResponseModel.fromJson(e)).toList();
  }
}
