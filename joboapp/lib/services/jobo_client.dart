import 'package:dio/dio.dart';
import 'package:joboapp/models/auth_token.dart';
import 'package:joboapp/models/jobs_model.dart';
import 'package:joboapp/models/user_model.dart';

class JoboClient {
  final _httpClient = Dio(
    BaseOptions(
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  final baseUri = "http://localhost:5226";

  Future<AuthToken> generateToken(UserModel userModel) async {
    final response = await _httpClient.post(
      "$baseUri/v1/token",
      data: userModel.toJson(),
    );

    return AuthToken.fromJson(response.data);
  }

  Future<ManyJobs> getAllJobs(String token) async {
    final response = await _httpClient.get(
      "$baseUri/jobs/all",
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    return ManyJobs.fromJson(response.data);
  }
}
