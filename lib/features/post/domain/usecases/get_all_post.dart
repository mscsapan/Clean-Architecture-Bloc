import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetAllPosts {
  final PostRepository postRepository;

  GetAllPosts({required this.postRepository});

  Future<Future<Either<Failure, List<Post>>>> getAllPostFunction() async {
    return postRepository.getAllPost();
  }
}
