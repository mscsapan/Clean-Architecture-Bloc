import 'package:clean_architecture_bloc/features/post/domain/entities/post.dart';
import 'package:equatable/equatable.dart';

class PostModel extends Post {
  const PostModel({
    required int id,
    required String title,
    required String body,
  }) : super(id: id, title: title, body: body);

  PostModel copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
        id: id ?? this.id, title: title ?? this.title, body: body ?? this.body);
  }

  factory PostModel.fromJson(Map<String, dynamic> post) {
    return PostModel(id: post['id'], title: post['title'], body: post['body']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, body: $body)';
  }
}
