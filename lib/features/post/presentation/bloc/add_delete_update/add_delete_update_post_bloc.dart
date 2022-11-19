import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';
import '../../../domain/usecases/add_new_post.dart';
import '../../../domain/usecases/delete_post.dart';
import '../../../domain/usecases/update_post.dart';

part 'add_delete_update_post_event.dart';

part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddNewPost addNewPost;
  final UpdatePost updatePost;
  final DeletePost deletePost;

  AddDeleteUpdatePostBloc({
    required this.addNewPost,
    required this.updatePost,
    required this.deletePost,
  }) : super(AddDeleteUpdatePostStateInitial()) {
    on<AddDeleteUpdatePostEvent>((event, Emitter emit) async {
      if (event is AddNewPostEvent) {
        emit(AddDeleteUpdatePostLoading());
        final addNewPostResult = await addNewPost.addNewPost(event.addNewPost);
        addNewPostResult.fold(
          (l) => emit(
              const AddDeleteUpdatePostError(errorMessage: 'Post not Added')),
          (addNewPost) => emit(
            const AddDeleteUpdatePostMessage(
                message: 'New Post Added Successfully'),
          ),
        );
      } else if (event is UpdatePostEvent) {
        emit(AddDeleteUpdatePostLoading());
        final updatePostResult = await updatePost.updatePost(event.updatePost);
        updatePostResult.fold(
          (l) => emit(
              const AddDeleteUpdatePostError(errorMessage: 'Post not Updated')),
          (addNewPost) => emit(
            const AddDeleteUpdatePostMessage(
                message: 'Post Updated Successfully'),
          ),
        );
      } else if (event is DeletePostEvent) {
        emit(AddDeleteUpdatePostLoading());
        final deletePostResult = await deletePost.deletePost(event.postId);
        deletePostResult.fold(
          (l) => emit(
              const AddDeleteUpdatePostError(errorMessage: 'Post not Delete')),
          (addNewPost) => emit(
            const AddDeleteUpdatePostMessage(
                message: 'Post Delete Successfully'),
          ),
        );
      }
    });
  }
}
