sealed class AppException implements Exception {
  const AppException({this.message});
  final String? message;
}

class AppExceptionGeneric extends AppException {
  const AppExceptionGeneric({super.message});
}

extension LoginWhen on AppException {
  T when<T>({
    required T Function() generic,
  }) {
    if (this is AppExceptionGeneric) {
      return generic.call();
    }
    throw Exception(
        'Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.');
  }
}
