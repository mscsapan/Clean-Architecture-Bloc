import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/post_model.dart';
import '../repositories/post_repository.dart';

class AddNewPost {
  PostRepository postRepository;

  AddNewPost({required this.postRepository});

  Future<Either<Failure, Unit>> addNewPost(PostModel post) async {
    return postRepository.addNewPost(post);
  }
}
