import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(PostModel postModel, int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<PostCommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    final response = await _dio.post(_PostServicePath.post.name, data: postModel);

    return response.statusCode == HttpStatus.created;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    final response = await _dio.put('${_PostServicePath.post.name}/$id', data: postModel);

    return response.statusCode == HttpStatus.ok;
  }

  @override
  Future<bool> deleteItemToService(PostModel postModel, int id) async {
    final response = await _dio.put('${_PostServicePath.post.name}/$id');

    return response.statusCode == HttpStatus.ok;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePath.post.name);

      if (response.statusCode == HttpStatus.ok) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  @override
  Future<List<PostCommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response =
          await _dio.get(_PostServicePath.post.name, queryParameters: {_PostQueryPath.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostCommentModel.fromJson(e)).toList();
        }
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}

enum _PostServicePath { post, comments }

enum _PostQueryPath { postId, comments }
