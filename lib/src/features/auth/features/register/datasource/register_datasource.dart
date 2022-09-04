import 'package:http/http.dart';

import '../../../../../exceptions/failure.dart';
import '../../../../../services/api_service.dart';
import '../../model/user.dart';

class RegisterDatasource {
  final ApiService service;

  RegisterDatasource(this.service);
  Future<User> register(
    String username,
    String password,
  ) async {
    try {
      final response = await service.post(
        path: "/auth/login",
        body: {
          "username": username,
          "password": password,
        },
      ) as Response;
      if (response.statusCode == 200) {
        final user = User.fromJson(response.body);
        return user;
      } else {
        throw Failure(
          message: "Failed to register. Please try again.",
          code: 500,
          type: "Error",
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
