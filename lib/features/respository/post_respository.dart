import 'package:dartz/dartz.dart';
import 'package:fetch_api_with_proper_architecure/features/data/models/post_response_model.dart';

abstract class PostReposiotory {
  Future<Either<String, List<PostResponseModel>>> getPost();
}
