part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isWorking;
  final bool isLoggedIn;

  final String error;
  final String accion;

  const AuthState({
    this.isWorking = false,
    this.isLoggedIn = false,
    this.error = '',
    this.accion = '',
  });

  AuthState copyWith(
          {bool? isWorking, bool? isLoggedIn, String? error, String? accion}) =>
      AuthState(
        isWorking: isWorking ?? this.isWorking,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        error: error ?? this.error,
        accion: accion ?? this.accion,
      );

  @override
  List<Object> get props => [isWorking, isLoggedIn, error, accion];
}
