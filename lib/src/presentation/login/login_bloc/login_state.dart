part of 'login_cubit.dart';

enum LoginProcess { initial, loading, success, failed, error }

class LoginState extends Equatable {
  const LoginState({this.loginProcess = LoginProcess.initial});

  final LoginProcess loginProcess;

  @override
  List<Object> get props => [loginProcess];

  LoginState copyWith({LoginProcess? loginProcessValue}) {
    return LoginState(loginProcess: loginProcessValue ?? loginProcess);
  }
}
