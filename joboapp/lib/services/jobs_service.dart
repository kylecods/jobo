import 'package:joboapp/models/auth_token.dart';
import 'package:joboapp/models/jobs_model.dart';
import 'package:joboapp/models/user_model.dart';
import 'package:joboapp/services/jobo_client.dart';

class JobsService {
  final _joboClient = JoboClient();
  bool logged() => false;

  Future<AuthToken> generateToken(UserModel user) =>
      _joboClient.generateToken(user);

  Future<ManyJobs> getAllJobs(String token) => _joboClient.getAllJobs(token);
}
