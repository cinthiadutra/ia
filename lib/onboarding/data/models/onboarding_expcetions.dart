sealed class OnboardingException implements Exception {
  const OnboardingException({this.message});
  final String? message;
}

class OnboardingExceptionGeneric extends OnboardingException {
  const OnboardingExceptionGeneric({super.message});
}

extension LoginWhen on OnboardingException {
  T when<T>({
    required T Function() generic,
  }) {
    if (this is OnboardingExceptionGeneric) {
      return generic.call();
    }
    throw Exception(
        'Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.');
  }
}
