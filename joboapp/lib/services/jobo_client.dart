import 'package:dio/dio.dart';
import 'package:joboapp/models/auth_token.dart';
import 'package:joboapp/models/user_model.dart';

class JoboClient {
  final _httpClient = Dio();

  Future<AuthToken> generateToken(UserModel userModel) async {
    final response = await _httpClient.post(
      "http://3aef-197-232-55-174.ngrok.io/v1/token",
      data: userModel.toJson(),
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    return AuthToken.fromJson(response.data);
  }
}
