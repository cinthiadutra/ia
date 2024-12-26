sealed class RegisterException implements Exception {
  const RegisterException({this.message});
  final String? message;
}

class RegisterExceptionGeneric extends RegisterException {
  const RegisterExceptionGeneric({super.message});
}

extension LoginWhen on RegisterException {
  T when<T>({
    required T Function() generic,
  }) {
    if (this is RegisterExceptionGeneric) {
      return generic.call();
    }
    throw Exception(
        'Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.');
  }
}
