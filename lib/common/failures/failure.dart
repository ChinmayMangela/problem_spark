

abstract class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {required this.code});

  @override
  String toString() {
    return "$runtimeType: $message ${code != null ? 'code: $code' : ''}";
  }
}