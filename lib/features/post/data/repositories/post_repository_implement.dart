import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../network/post_network.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/post_model.dart';

typedef MyCustomFunction = Future<Unit> Function();

class PostRepositoryImpl implements PostRepository {
  PostRemoteDataSource postRemoteDataSource;
  PostLocalDataSource postLocalDataSource;
  final PostNetwork postNetwork;

  PostRepositoryImpl(
      {required this.postRemoteDataSource,
      required this.postLocalDataSource,
      required this.postNetwork});

  @override
  Future<Either<Failure, Unit>> addNewPost(PostModel post) async {
    PostModel addNewPost =
        PostModel(id: post.id, title: post.title, body: post.body);
    return _getCustomMessages(() {
      return postRemoteDataSource.addNewAllRemotePost(addNewPost);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return _getCustomMessages(() {
      return postRemoteDataSource.deleteAllRemotePost(postId);
    });
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllPost() async {
    if (await postNetwork.getConnected) {
      try {
        final postData = await postRemoteDataSource.getAllRemotePost();
        postLocalDataSource.cachedPosts(postData);
        return Right(postData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPost = await postLocalDataSource.getCachedPosts();
        return Right(localPost);
      } on EmptyCachedException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostModel post) async {
    final updatePost =
        PostModel(id: post.id, title: post.title, body: post.body);
    if (await postNetwork.getConnected) {
      await postRemoteDataSource.updateAllRemotePost(updatePost);
      return const Right(unit);
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, Unit>> _getCustomMessages(
      MyCustomFunction postFunction) async {
    if (await postNetwork.getConnected) {
      try {
        await postFunction();
        return const Right(unit);
      } on ServerException {
        return Left(OfflineFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
