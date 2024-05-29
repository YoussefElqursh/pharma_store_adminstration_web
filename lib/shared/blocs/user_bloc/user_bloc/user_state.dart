part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}
final class UserLoadingState extends UserState {}
final class UserSuccessState extends UserState {}
final class UserErrorState extends UserState {

}
