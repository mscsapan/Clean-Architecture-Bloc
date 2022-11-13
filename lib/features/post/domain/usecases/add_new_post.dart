import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class AddNewPost {
  PostRepository postRepository;

  AddNewPost({required this.postRepository});

  Future<Either<Failure, Unit>> addNewPost(Post post) async {
    return postRepository.addNewPost(post);
  }
}
