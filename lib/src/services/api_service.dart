abstract class ApiService {
  Future<dynamic> get({required String path, Map<String, dynamic>? params});
  Future<dynamic> post({required String path, Map<dynamic, dynamic>? body});
  Future<dynamic> put({required String path, Map<dynamic, dynamic>? body});
  Future<dynamic> patch({required String path, Map? body});
  Future<dynamic> delete({required String path});
}
