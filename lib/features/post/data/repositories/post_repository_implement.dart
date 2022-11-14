import 'package:clean_architecture_bloc/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../network/post_network.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  PostRemoteDataSource postRemoteDataSource;
  PostLocalDataSource postLocalDataSource;
  final PostNetwork postNetwork;

  PostRepositoryImpl(
      {required this.postRemoteDataSource,
      required this.postLocalDataSource,
      required this.postNetwork});

  @override
  Future<Either<Failure, Unit>> addNewPost(Post post) {
    // TODO: implement addNewPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPost() async {
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

//8 no. video 13.0 sec
  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
