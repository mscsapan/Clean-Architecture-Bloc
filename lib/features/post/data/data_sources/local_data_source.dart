import 'package:dartz/dartz.dart';

import '../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> cachedPostLocalData();

  Future<Unit> cachedPost(List<PostModel> post);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<Unit> cachedPost(List<PostModel> post) {
    // TODO: implement cachedPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> cachedPostLocalData() {
    // TODO: implement cachedPostLocalData
    throw UnimplementedError();
  }
}
