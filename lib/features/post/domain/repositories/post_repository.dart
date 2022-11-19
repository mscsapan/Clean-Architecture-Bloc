import '../../data/models/post_model.dart';
import '/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostModel>>> getAllPost();

  Future<Either<Failure, Unit>> deletePost(int postId);

  Future<Either<Failure, Unit>> updatePost(PostModel post);

  Future<Either<Failure, Unit>> addNewPost(PostModel post);
}
