import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';

const String cachedPost = 'CACHED_POST';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();

  Future<Unit> cachedPosts(List<PostModel> post);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachedPosts(List<PostModel> post) {
    List postToMap = post.map((e) => e.toMap()).toList();
    String encodedString = json.encode(postToMap);
    sharedPreferences.setString(cachedPost, encodedString);
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    final encodedString = sharedPreferences.getString(cachedPost);
    if (encodedString != null) {
      List decodedPost = json.decode(encodedString);
      List<PostModel> postModel =
          decodedPost.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return Future.value(postModel);
    } else {
      throw EmptyCachedException();
    }
  }
}
