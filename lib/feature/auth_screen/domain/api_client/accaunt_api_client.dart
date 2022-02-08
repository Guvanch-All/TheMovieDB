import 'package:the_movie_db/core/api/configuration/configuration.dart';
import 'package:the_movie_db/core/api/network_client.dart';
import 'package:the_movie_db/domain/entity/account_get_info.dart';

///Тут ещё есть MediaType тоже сюда


class AccountApiClient{
  final _networkClient = NetworkClient();

  Future<AccountGetInfo> getAccountInfo(
      String sessionId,
      ) async {
    AccountGetInfo parser (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = AccountGetInfo.fromJson(jsonMap);
      return response;
    };
    final result = _networkClient.get(
      '/account',
      parser,
      <String, dynamic>{
        'append_to_response': 'credits,videos',
        'api_key': Configuration.apiKey,
        'session_id': sessionId,
      },
    );
    return result;
  }

  ///Здесь должен быть апи MarkIsFavority

}
