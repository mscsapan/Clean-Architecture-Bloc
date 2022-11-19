import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/post_model.dart';
import '../repositories/post_repository.dart';

class UpdatePost {
  PostRepository postRepository;

  UpdatePost({required this.postRepository});

  Future<Either<Failure, Unit>> updatePost(PostModel post) async {
    return postRepository.updatePost(post);
  }
}
