part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthLogin extends AuthState {}

class AuthSignUp extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailed extends AuthState {
  final String message;
  LoginFailed(this.message);
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailed extends AuthState {
  final String message;
  SignUpFailed(this.message);
}

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutFailed extends AuthState {
  final String message;
  LogoutFailed(this.message);
}
