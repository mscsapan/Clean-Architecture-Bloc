import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class UpdatePost {
  PostRepository postRepository;

  UpdatePost({required this.postRepository});

  Future<Either<Failure, Unit>> updatePost(Post post) async {
    return postRepository.updatePost(post);
  }
}
