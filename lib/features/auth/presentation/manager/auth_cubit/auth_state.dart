part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthLoginFailed extends AuthState {
  final String error;

  AuthLoginFailed(this.error);
}

final class AuthSignupLoading extends AuthState {}

final class AuthSignupSuccess extends AuthState {}

final class AuthSignupFailed extends AuthState {
  final String error;

  AuthSignupFailed(this.error);
}
