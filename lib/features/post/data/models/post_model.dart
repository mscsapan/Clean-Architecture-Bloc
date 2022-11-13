import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int id;
  final String title;
  final String body;

  const PostModel({required this.id, required this.title, required this.body});

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

  @override
  List<Object?> get props => [id, title, bool];
}
