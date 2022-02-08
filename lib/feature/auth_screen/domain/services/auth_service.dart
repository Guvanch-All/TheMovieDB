import 'package:the_movie_db/domain/data_providers/session_data_provider.dart';
import 'package:the_movie_db/feature/auth_screen/domain/api_client/accaunt_api_client.dart';
import 'package:the_movie_db/feature/auth_screen/domain/api_client/auth_api_client.dart';

class AuthService {
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login(String login, String password) async {
    final sessionId = await _authApiClient.auth(
      username: login,
      password: password,
    );
    final accountId = await _accountApiClient.getAccountInfo(sessionId);
    await _sessionDataProvider.setSessionId(sessionId);
  }
}
