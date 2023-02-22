import 'package:dio/dio.dart';
import 'package:joboapp/models/auth_token.dart';
import 'package:joboapp/models/user_model.dart';

class JoboClient {
  final _httpClient = Dio();

  Future<AuthToken> generateToken(UserModel userModel) async {
    final response = await _httpClient.post(
      "http://0b1d-197-232-55-174.ngrok.io/v1/token",
      data: userModel.toJson(),
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    return AuthToken.fromJson(response.data);
  }

  // Future<String> createJob() async {
  //   final response = await _httpClient.post(
  //     "http://localhost:5226/v1/token",
  //     data: ,
  //     options: Options( headers: {
  //       "Content-Type": "application/json",
  //           "Authorization":
  //               "Bearer $token",
  //     })
  //   );
  //   return response.data as String;
  // }
}
