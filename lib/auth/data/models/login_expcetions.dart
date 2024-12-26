sealed class LoginException implements Exception {
  const LoginException({this.message, this.code});
  final String? message;
  final int? code; // Código de erro opcional
}

class InvalidCredentialsException extends LoginException {
  const InvalidCredentialsException({super.message}) : super(code: 401);
}

class UserNotFoundException extends LoginException {
  const UserNotFoundException({super.message}) : super(code: 404);
}

class NetworkException extends LoginException {
  const NetworkException({super.message}) : super(code: 500);
}

class LoginExceptionGeneric extends LoginException {
  const LoginExceptionGeneric({super.message}) : super(code: 0);
}

extension LoginWhen on LoginException {
  T when<T>({
    required T Function() invalidCredentials,
    required T Function() userNotFound,
    required T Function() networkError,
    required T Function() generic,
  }) {
    if (this is InvalidCredentialsException) {
      return invalidCredentials.call();
    } else if (this is UserNotFoundException) {
      return userNotFound.call();
    } else if (this is NetworkException) {
      return networkError.call();
    } else if (this is LoginExceptionGeneric) {
      return generic.call();
    }
    throw Exception(
        'Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte. $this');
  }
}
