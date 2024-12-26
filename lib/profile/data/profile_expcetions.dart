sealed class ProfileException implements Exception {
  const ProfileException({this.message});
  final String? message;
}

class ProfileExceptionGeneric extends ProfileException {
  const ProfileExceptionGeneric({super.message});
}

extension ProfileWhen on ProfileException {
  T when<T>({
    required T Function() generic,
  }) {
    if (this is ProfileExceptionGeneric) {
      return generic.call();
    }
    throw Exception(
        'Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.');
  }
}
