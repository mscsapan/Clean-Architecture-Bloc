import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/post_model.dart';
import '../repositories/post_repository.dart';

class GetAllPosts {
  final PostRepository postRepository;

  GetAllPosts({required this.postRepository});

  Future<Either<Failure, List<PostModel>>> getAllPostFunction() async {
    return postRepository.getAllPost();
  }
}
