import 'package:dartz/dartz.dart';
import 'package:fetch_api_with_proper_architecure/core/api_exception.dart';
import 'package:fetch_api_with_proper_architecure/features/data/data_sources/post_data_source.dart';
import 'package:fetch_api_with_proper_architecure/features/data/models/post_response_model.dart';
import '../../core/app_error.dart';

abstract class PostRepository {
  Future<Either<AppError, List<PostResponseModel>>> getPost();
}

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;
  PostRepositoryImpl(this._postDataSource);
  @override
  Future<Either<AppError, List<PostResponseModel>>> getPost() async {
    try {
      final result = await _postDataSource.getPost();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }
}
