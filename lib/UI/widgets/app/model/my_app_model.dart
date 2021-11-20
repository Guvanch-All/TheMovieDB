import 'package:the_movie_db/domain/data_providers/session_data_provider.dart';

class MyAppModel{
  final _sessionDataProvider = SessionDataProvider();
  var _isAuth = false;
  //чтобы можно было менять только из внутри и только для того чтобы
  //получать доступ с наружи
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async{
    final sessionId = await _sessionDataProvider.getSessionId();
    _isAuth = sessionId != null;
  }
}