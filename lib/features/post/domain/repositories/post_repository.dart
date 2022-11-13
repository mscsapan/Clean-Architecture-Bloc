import '/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/post.dart'; //5 no video 9:59

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPost();

  Future<Either<Failure, Unit>> deletePost(int postId);

  Future<Either<Failure, Unit>> updatePost(Post post);

  Future<Either<Failure, Unit>> addNewPost(Post post);
}
