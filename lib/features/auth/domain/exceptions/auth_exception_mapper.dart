import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:problem_spark/constants/firebase_auth_error_codes.dart';
import 'package:problem_spark/features/auth/domain/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthExceptionMapper {
  AuthExceptionMapper._();

  static AuthException mapFirebaseAuthException(FirebaseAuthException e) {
    if (kDebugMode) print('${e.code}: ${e.message}');

    String? errorMessage;
    switch (e.code) {
      case FirebaseAuthErrorCodes.invalidEmail:
        errorMessage = 'Invalid email address';
        break;
      case FirebaseAuthErrorCodes.userDisabled:
        errorMessage = 'This user account has been disabled.';
        break;
      case FirebaseAuthErrorCodes.userNotFound:
        errorMessage = 'No user found for that email.';
        break;
      case FirebaseAuthErrorCodes.wrongPassword:
        errorMessage = 'Incorrect password.';
        break;
      case FirebaseAuthErrorCodes.emailAlreadyInUse:
        errorMessage = 'This email is already in use.';
        break;
      case FirebaseAuthErrorCodes.operationNotAllowed:
        errorMessage = 'Email/password accounts are not enabled.';
        break;
      case FirebaseAuthErrorCodes.weakPassword:
        errorMessage = 'The password is too weak.';
        break;
      case FirebaseAuthErrorCodes.networkRequestFailed:
        errorMessage = 'Network error, please try again.';
        break;
      case FirebaseAuthErrorCodes.tooManyRequests:
        errorMessage = 'Too many attempts, please try later.';
        break;
      case FirebaseAuthErrorCodes.invalidCredential:
        errorMessage = 'Invalid credentials.';
        break;
      default:
        errorMessage = 'Authentication error: ${e.message}';
    }

    return AuthException(errorMessage, code: e.code);
  }

  static AuthException mapFormatException(FormatException e) {
    if (kDebugMode) {
      print(e);
    }
    return AuthException(e.message, code: 'format-error');
  }

  static AuthException mapGenericException(Object e) {
    if (kDebugMode) {
      print(e);
    }
    return AuthException(e.toString(), code: 'generic-error');
  }

  static AuthException mapSocketException(SocketException e) {
    if (kDebugMode) {
      print('SocketException: ${e.message}, OS error: ${e.osError?.message}');
    }

    return AuthException(
      'No internet connection or server unreachable. Please check your network',
      code: 'network-unavailable',
    );
  }
}
