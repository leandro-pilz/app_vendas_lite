sealed class DefaultException implements Exception {
  final String message;

  const DefaultException({required this.message});
}

class UserIsNullException extends DefaultException {
  const UserIsNullException({required super.message});
}
