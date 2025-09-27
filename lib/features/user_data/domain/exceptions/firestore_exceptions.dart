
class FirestoreException implements Exception {
  final String message;
  final String? code;

  FirestoreException(this.message, {this.code});

  @override
  String toString() {
    return 'FirestoreException(message: $message, code: $code)';
  }
}
