import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:the_movie_db/domain/data_providers/session_data_provider.dart';
import 'package:the_movie_db/feature/auth_screen/domain/api/accaunt_api_client.dart';
import 'package:the_movie_db/feature/auth_screen/domain/api/auth_api_client.dart';

abstract class AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

class AuthCheckStatus extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String login;
  final String password;

  AuthLoginEvent({
    required this.login,
    required this.password,
  });
}

enum AuthStateStatus { authorized, notAuthorized, inProgress }

///Соятоянии (States)
abstract class AuthState {}

class AuthAuthorizedState extends AuthState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthAuthorizedState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthUnauthorizedState extends AuthState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUnauthorizedState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthFailureState extends AuthState {
  final Object error;

  AuthFailureState(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthFailureState &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}

///БЛОК
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  AuthBloc(AuthState initialState) : super(initialState) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckStatus) {
        onAuthCheckStatusEvent(event, emit);
      } else if (event is AuthLoginEvent) {
        onAuthLoginEvent(event, emit);
      } else if (event is AuthLogoutEvent) {
        onAuthLogoutEvent(event, emit);
      }
    }, transformer: sequential());
    add(AuthCheckStatus());
  }

  void onAuthCheckStatusEvent(
    AuthCheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final newState =
        sessionId != null ? AuthAuthorizedState() : AuthUnauthorizedState();
    emit(newState);
  }

  void onAuthLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final sessionId = await _authApiClient.auth(
        username: event.login,
        password: event.password,
      );
      final accountId = await _accountApiClient.getAccountInfo(sessionId);
      await _sessionDataProvider.setSessionId(sessionId);
      await _sessionDataProvider.setAccountId(accountId);

      emit(AuthAuthorizedState());
    } catch (e) {
      AuthFailureState(e);
    }
  }

  void onAuthLogoutEvent(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _sessionDataProvider.deleteSessionId();
      await _sessionDataProvider.deleteAccountId();
    } catch (e) {
      AuthFailureState(e);
    }
  }
}

class AuthInProgressState extends AuthState {}
