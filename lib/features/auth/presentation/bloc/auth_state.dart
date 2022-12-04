part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Login? login;
  final String message;
  final RequestState loginRequestState;

  const AuthState(
      {this.login,
      this.message = '',
      this.loginRequestState = RequestState.loading});
  AuthState copyWith({
    Login? login,
    String? message,
    RequestState? loginRequestState,
  }) {
    return AuthState(
      login: login ?? this.login,
      loginRequestState: loginRequestState ?? this.loginRequestState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [loginRequestState, login, message];
}
