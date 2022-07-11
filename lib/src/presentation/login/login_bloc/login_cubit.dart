import 'package:doit/src/infrastructure/data/remote/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final AuthRepository _authRepository = AuthRepository();

  void signInWithGoogle() async {
    emit(const LoginState(loginProcess: LoginProcess.loading));
    try {
      final tokenId = await _authRepository.signInWithGoogle();
      if (tokenId != null) {
        emit(const LoginState(loginProcess: LoginProcess.success));
      } else {
        emit(const LoginState(loginProcess: LoginProcess.failed));
      }
    } catch (e) {
      emit(const LoginState(loginProcess: LoginProcess.error));
    }
  }

  void signInWithFB() async {
    emit(const LoginState(loginProcess: LoginProcess.loading));
    try {
      final tokenId = await _authRepository.signInWithFB();
      if (tokenId != null) {
        emit(const LoginState(loginProcess: LoginProcess.success));
      } else {
        emit(const LoginState(loginProcess: LoginProcess.failed));
      }
    } catch (e) {
      emit(const LoginState(loginProcess: LoginProcess.error));
    }
  }

  void signOut() async {
    emit(const LoginState(loginProcess: LoginProcess.loading));
    try {
      await _authRepository.signOut();
      emit(const LoginState(loginProcess: LoginProcess.success));
    } catch (e) {
      emit(const LoginState(loginProcess: LoginProcess.error));
    }
  }
}
