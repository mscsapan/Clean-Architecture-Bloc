part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostStateLoading extends PostState {}

class PostStateLoaded extends PostState {
  final List<PostModel> posts;

  const PostStateLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class PostStateError extends PostState {
  final String message;

  const PostStateError({required this.message});

  @override
  List<Object> get props => [message];
}
