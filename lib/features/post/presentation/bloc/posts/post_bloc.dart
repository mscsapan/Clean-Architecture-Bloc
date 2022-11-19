import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/error/failures.dart';
import '../../../data/models/post_model.dart';
import '../../../domain/usecases/get_all_post.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPosts posts;

  PostBloc({required this.posts}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is GetAllPostEvent) {
        emit(PostStateLoading());
        final result = await posts.getAllPostFunction();
        result.fold(
          (f) => emit(
            PostStateError(message: _mapToFailure(f)),
          ),
          (r) => emit(
            PostStateLoaded(posts: r),
          ),
        );
      } else if (event is RefreshAllPostEvent) {
        emit(PostStateLoading());
        final refreshPost = await posts.getAllPostFunction();
        emit(_mapToPostState(refreshPost));
      }
    });
  }

  PostState _mapToPostState(Either<Failure, List<PostModel>> either) {
    return either.fold(
        (failure) => PostStateError(message: _mapToFailure(failure)),
        (posts) => PostStateLoaded(posts: posts));
  }

  String _mapToFailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case OfflineFailure:
        return 'OffLine Failure';
      case EmptyCachedFailure:
        return 'Empty Cached Failure';
      default:
        return 'Unauthorized Failure';
    }
  }
}
