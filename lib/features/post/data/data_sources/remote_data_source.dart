import 'dart:convert';

import '/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/post.dart';
import '../models/post_model.dart';
import 'package:http/http.dart' as http;

const String rootUrl = 'https://jsonplaceholder.typicode.com/';
const String baseUrl = '${rootUrl}posts';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllRemotePost();

  Future<Unit> deleteAllRemotePost(int postId);

  Future<Unit> updateAllRemotePost(Post post);

  Future<Unit> addNewAllRemotePost(Post post);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> addNewAllRemotePost(Post post) async {
    final body = {
      'id': post.id,
      'title': post.title,
      'body': post.body,
    };
    http.Response response = await client.post(Uri.parse(baseUrl),
        body: body, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteAllRemotePost(int postId) async {
    http.Response response =
        await client.delete(Uri.parse('${rootUrl}post$postId'.toString()));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getAllRemotePost() async {
    http.Response response = await client
        .get(Uri.parse(baseUrl), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<PostModel> postModels =
          data.map((post) => PostModel.fromJson(post)).toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateAllRemotePost(Post post) async {
    final id = post.id.toString();
    final body = {
      'id': post.id,
      'title': post.title,
      'body': post.body,
    };
    http.Response response = await client.post(Uri.parse('${rootUrl}post$id'),
        body: body, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
