part of 'login_auth_cubit.dart';

@immutable
sealed class LoginAuthState {}

final class LoginAuthInitialState extends LoginAuthState {}

final class LoginAuthLoadingState extends LoginAuthState {}

final class LoginAuthSuccessState extends LoginAuthState {}

final class LoginAuthErrorState extends LoginAuthState {
  final String message;

  LoginAuthErrorState({required this.message});
}
