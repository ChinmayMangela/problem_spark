
import '../../../../common/exception/app_exception.dart';

class AuthException extends AppException {
  AuthException(super.message, {super.code});

  @override
  String toString() {
    return 'AuthException(message: $message, code: $code)';
  }
}