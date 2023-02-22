import 'package:joboapp/models/auth_token.dart';
import 'package:joboapp/models/user_model.dart';
import 'package:joboapp/services/jobo_client.dart';

class JobsService {
  final joboClient = JoboClient();
  bool logged() => true;

  Future<AuthToken> generateToken(UserModel user) =>
      joboClient.generateToken(user);
}
