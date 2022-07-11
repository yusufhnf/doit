import 'dart:io';

class ErrorHandler {
  final String _errorMessage;

  const ErrorHandler._(this._errorMessage);

  factory ErrorHandler.error(Object? exception) {
    if (exception is HttpException) {
      return ErrorHandler._(exception.message);
    } else if (exception is RepositoryException) {
      return ErrorHandler._(exception.message ?? 'Repository problem');
    } else if (exception is AuthException) {
      return ErrorHandler._(exception.getErrorMessage);
    } else if (exception is ConnectivityException) {
      return ErrorHandler._(exception.getErrorMessage);
    }

    return const ErrorHandler._('Something wrong');
  }

  String get getErrorMessage => _errorMessage;
}

class RepositoryException implements Exception {
  final String? message;

  const RepositoryException(this.message);

  @override
  String toString() => 'RepositoryException : $message';
}

class AuthException implements Exception {
  final String? errorMessage;

  const AuthException({this.errorMessage});

  String get getErrorMessage => errorMessage ?? 'Authentication has Problem';

  @override
  String toString() => 'AuthError : $getErrorMessage';
}

class ConnectivityException implements Exception {
  final bool isStatusAirplane;

  ConnectivityException({this.isStatusAirplane = false});

  String get getErrorMessage {
    if (isStatusAirplane) {
      return 'No network connection';
    }
    return 'There is network problem';
  }

  @override
  String toString() => 'ConnectivityException : $getErrorMessage';
}
