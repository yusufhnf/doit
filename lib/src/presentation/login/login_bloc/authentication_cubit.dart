import 'package:doit/src/infrastructure/data/remote/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState());
  final AuthRepository _authRepository = AuthRepository();

  void signInWithGoogle() async {
    emit(const AuthenticationState(loginProcess: LoginProcess.loading));
    try {
      final tokenId = await _authRepository.signInWithGoogle();
      if (tokenId != null) {
        emit(const AuthenticationState(loginProcess: LoginProcess.success));
      } else {
        emit(const AuthenticationState(loginProcess: LoginProcess.failed));
      }
    } catch (e) {
      emit(const AuthenticationState(loginProcess: LoginProcess.error));
    }
  }

  void signInWithFB() async {
    emit(const AuthenticationState(loginProcess: LoginProcess.loading));
    try {
      final tokenId = await _authRepository.signInWithFB();
      if (tokenId != null) {
        emit(const AuthenticationState(loginProcess: LoginProcess.success));
      } else {
        emit(const AuthenticationState(loginProcess: LoginProcess.failed));
      }
    } catch (e) {
      emit(const AuthenticationState(loginProcess: LoginProcess.error));
    }
  }

  void signOut() async {
    emit(const AuthenticationState(loginProcess: LoginProcess.loading));
    try {
      await _authRepository.signOut();
      emit(const AuthenticationState(loginProcess: LoginProcess.success));
    } catch (e) {
      emit(const AuthenticationState(loginProcess: LoginProcess.error));
    }
  }
}
