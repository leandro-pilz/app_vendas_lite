import '../entities/user_entity.dart';
import '../entities/user_token_entity.dart';

sealed class UserState {}

base class UserStateInitial extends UserState {}

base class UserStateLoading extends UserState {}

base class UserStateUserLoaded extends UserState {
  final User user;

  UserStateUserLoaded({required this.user});
}

base class UserStateTokenLoaded extends UserState {
  final UserToken userToken;

  UserStateTokenLoaded({required this.userToken});
}

base class UserStateError extends UserState {
  final String message;

  UserStateError({required this.message});
}
