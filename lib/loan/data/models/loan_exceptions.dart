sealed class LoanException implements Exception {
  const LoanException({this.message});
  final String? message;
}

class LoanExceptionGeneric extends LoanException {
  const LoanExceptionGeneric({super.message});
}

extension LoginWhen on LoanException {
  T when<T>({
    required T Function() generic,
  }) {
    if (this is LoanExceptionGeneric) {
      return generic.call();
    }
    throw Exception(
        'Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.');
  }
}
