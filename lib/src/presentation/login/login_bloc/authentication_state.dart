part of 'authentication_cubit.dart';

enum LoginProcess { initial, loading, success, failed, error }

class AuthenticationState extends Equatable {
  const AuthenticationState({this.loginProcess = LoginProcess.initial});

  final LoginProcess loginProcess;

  @override
  List<Object> get props => [loginProcess];

  AuthenticationState copyWith({LoginProcess? loginProcessValue}) {
    return AuthenticationState(loginProcess: loginProcessValue ?? loginProcess);
  }
}
