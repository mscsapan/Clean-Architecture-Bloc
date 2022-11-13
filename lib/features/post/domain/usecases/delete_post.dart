import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/post_repository.dart';

class DeletePost {
  PostRepository postRepository;

  DeletePost({required this.postRepository});

  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return postRepository.deletePost(postId);
  }
}
