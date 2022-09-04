import 'dart:convert';

import 'package:dummy_json/src/services/api_service.dart';
import 'package:http/http.dart' as http;

class HttpService implements ApiService {
  final _urlBase = "dummyjson.com";

  @override
  Future delete({required String path}) async {
    Uri url = Uri.https(_urlBase, path);
    final response = await http.delete(url);
    return response;
  }

  @override
  Future get({required String path, Map<String, dynamic>? params}) async {
    Uri url = Uri.https(_urlBase, path, params);
    final response = await http.get(url);
    return response;
  }

  @override
  Future patch({required String path, Map? body}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post({required String path, Map? body}) async {
    Uri url = Uri.https(_urlBase, path);
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
    return response;
  }

  @override
  Future put({required String path, Map? body}) {
    Uri url = Uri.https(_urlBase, path);
    final response = http.post(url, body: body);
    return response;
  }
}
