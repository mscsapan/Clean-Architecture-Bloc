part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object?> get props => [];
}

class AddDeleteUpdatePostStateInitial extends AddDeleteUpdatePostState {
  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostLoading extends AddDeleteUpdatePostState {}

class AddDeleteUpdatePostError extends AddDeleteUpdatePostState {
  final String errorMessage;

  const AddDeleteUpdatePostError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class AddDeleteUpdatePostMessage extends AddDeleteUpdatePostState {
  final String message;

  const AddDeleteUpdatePostMessage({required this.message});

  @override
  List<Object?> get props => [message];
}
