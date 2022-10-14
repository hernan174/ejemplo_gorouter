part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnLoginAuth extends AuthEvent {
  const OnLoginAuth();
}

class OnLogoutAuth extends AuthEvent {
  const OnLogoutAuth();
}
