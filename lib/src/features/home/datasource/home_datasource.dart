import 'dart:convert';

import 'package:dummy_json/src/services/api_service.dart';
import 'package:http/http.dart';

import '../model/post.dart';

class HomeDatasource {
  final ApiService service;

  HomeDatasource(this.service);

  Future<List<Post>> getPosts() async {
    try {
      final response = await service.get(path: "/posts") as Response;

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body)["posts"] as List;
        final list = decoded.map((e) => Post.fromMap(e)).toList();
        return list;
      } else {
        throw Exception("erro ao buscar posts");
      }
    } catch (e) {
      rethrow;
    }
  }
}
