sealed class HomeException implements Exception {
  const HomeException({this.message});
  final String? message;
}

class HomeExceptionGeneric extends HomeException {
  const HomeExceptionGeneric({super.message});
}

extension LoginWhen on HomeException {
  T when<T>({
    required T Function() generic,
  }) {
    if (this is HomeExceptionGeneric) {
      return generic.call();
    }
    throw Exception(
        'Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.');
  }
}
