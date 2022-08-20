import 'package:fetch_api_with_proper_architecure/features/data/models/post_response_model.dart';
import 'package:fetch_api_with_proper_architecure/features/respository/post_respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostController
    extends StateNotifier<AsyncValue<List<PostResponseModel>>> {
  PostController(this._postRepository) : super(const AsyncValue.loading()) {
    fetchData();
  }
  final PostRepository _postRepository;
  fetchData() async {
    final result = await _postRepository.getPost();
    return result.fold((l) => state = AsyncValue.error(l.message),
        (r) => state = AsyncValue.data(r));
  }
}
