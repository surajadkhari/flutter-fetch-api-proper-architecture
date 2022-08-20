import '../models/post_response_model.dart';

abstract class PostDataSource {
  Future<List<PostResponseModel>> getPost(); 
}
