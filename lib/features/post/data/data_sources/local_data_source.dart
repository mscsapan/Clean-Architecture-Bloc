import 'package:dartz/dartz.dart';

import '../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();

  Future<Unit> cachedPosts(List<PostModel> post);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<Unit> cachedPosts(List<PostModel> post) {
    // TODO: implement cachedPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement cachedPostLocalData
    throw UnimplementedError();
  }
}
