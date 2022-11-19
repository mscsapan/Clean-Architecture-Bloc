part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  @override
  List<Object?> get props => [];
}

class AddNewPostEvent extends AddDeleteUpdatePostEvent {
  final PostModel addNewPost;

  const AddNewPostEvent({required this.addNewPost});

  @override
  List<Object?> get props => [addNewPost];
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final PostModel updatePost;

  const UpdatePostEvent({required this.updatePost});

  @override
  List<Object?> get props => [updatePost];
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;

  const DeletePostEvent({required this.postId});

  @override
  List<Object?> get props => [postId];
}
