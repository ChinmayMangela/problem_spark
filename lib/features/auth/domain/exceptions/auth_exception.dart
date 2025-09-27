
import '../../../../common/failures/failure.dart';

class AuthException extends AppException {
  AuthException(super.message, {super.code});
}