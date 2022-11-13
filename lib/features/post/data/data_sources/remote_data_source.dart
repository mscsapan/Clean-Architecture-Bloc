import 'package:dartz/dartz.dart';

import '../../domain/entities/post.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllRemotePost();

  Future<Unit> deleteAllRemotePost(int postId);

  Future<Unit> updateAllRemotePost(Post post);

  Future<Unit> addNewAllRemotePost(Post post);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<Unit> addNewAllRemotePost(Post post) {
    // TODO: implement addNewAllRemotePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteAllRemotePost(int postId) {
    // TODO: implement deleteAllRemotePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllRemotePost() {
    // TODO: implement getAllRemotePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateAllRemotePost(Post post) {
    // TODO: implement updateAllRemotePost
    throw UnimplementedError();
  }
}
