import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  PostRemoteDataSource postRemoteDataSource;
  PostLocalDataSource postLocalDataSource;

  PostRepositoryImpl(
      {required this.postRemoteDataSource, required this.postLocalDataSource});

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
  Future<Either<Failure, List<Post>>> getAllPost() {
    // return postRemoteDataSource.getAllRemotePost();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
