import 'package:bloc/bloc.dart';
import 'package:ejemplo_gorouter/page/global/environment.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<OnLoginAuth>(_onLoginAuth);
    on<OnLogoutAuth>(_onLogoutAuth);
  }

  Future<void> _onLoginAuth(OnLoginAuth event, Emitter emit) async {
    emit(state.copyWith(
      isWorking: true,
      isLoggedIn: false,
      error: '',
      accion: Environment.blocOnLoginAuth,
    ));

    emit(state.copyWith(isWorking: false, isLoggedIn: true));
  }

  Future<void> _onLogoutAuth(OnLogoutAuth event, Emitter emit) async {
    emit(state.copyWith(
      accion: Environment.blocOnLogoutAuth,
      isLoggedIn: false,
    ));
  }
}
