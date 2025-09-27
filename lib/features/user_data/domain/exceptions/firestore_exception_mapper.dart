import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:problem_spark/features/user_data/domain/exceptions/firestore_exceptions.dart';

import '../../../../constants/firebase_firestore_error_codes.dart';

class FirestoreExceptionMapper {
  FirestoreExceptionMapper._();

  static FirestoreException mapFirebaseException(FirebaseException e) {
    if (kDebugMode) {
      print('Firestore FirebaseException - Code: ${e.code}, Message: ${e.message}');
    }

    String errorMessage;
    switch (e.code) {
      case FirebaseFirestoreErrorCodes.cancelled:
        errorMessage = 'The operation was cancelled.';
        break;
      case FirebaseFirestoreErrorCodes.unknown:
        errorMessage = 'An unknown error occurred with Firestore.';
        break;
      case FirebaseFirestoreErrorCodes.invalidArgument:
        errorMessage = 'Invalid argument provided for Firestore operation.';
        break;
      case FirebaseFirestoreErrorCodes.deadlineExceeded:
        errorMessage = 'The operation timed out. Please try again.';
        break;
      case FirebaseFirestoreErrorCodes.notFound:
        errorMessage = 'The requested document or resource was not found.';
        break;
      case FirebaseFirestoreErrorCodes.alreadyExists:
        errorMessage = 'The item you are trying to create already exists.';
        break;
      case FirebaseFirestoreErrorCodes.permissionDenied:
        errorMessage = 'You do not have permission to perform this action.';
        break;
      case FirebaseFirestoreErrorCodes.resourceExhausted:
        errorMessage = 'Firestore resource limit exceeded. Please contact support if this persists.';
        break;
      case FirebaseFirestoreErrorCodes.failedPrecondition:
        errorMessage = 'Operation failed because the system is not in the required state (e.g., trying to modify a locked document).';
        break;
      case FirebaseFirestoreErrorCodes.aborted:
        errorMessage = 'The operation was aborted, possibly due to a conflict. Please try again.';
        break;
      case FirebaseFirestoreErrorCodes.outOfRange:
        errorMessage = 'The operation was attempted outside the valid range.';
        break;
      case FirebaseFirestoreErrorCodes.unimplemented:
        errorMessage = 'This Firestore operation is not implemented or not supported.';
        break;
      case FirebaseFirestoreErrorCodes.internal:
        errorMessage = 'An internal Firestore error occurred. Please try again later.';
        break;
      case FirebaseFirestoreErrorCodes.unavailable:
        errorMessage = 'Firestore is currently unavailable. Please check your internet connection and try again.';
        break;
      case FirebaseFirestoreErrorCodes.dataLoss:
        errorMessage = 'There was an unrecoverable data loss or corruption with Firestore.';
        break;
      default:
        errorMessage = e.message ?? 'An unexpected Firestore error occurred.';
    }
    return FirestoreException(errorMessage, code: e.code);
  }

  static FirestoreException mapSocketException(SocketException e) {
    if (kDebugMode) {
      print('Firestore SocketException: ${e.message}, OS error: ${e.osError?.message}');
    }
    return FirestoreException(
      'Network error: Could not connect to Firestore. Please check your internet connection.',
      code: 'network-unavailable',
    );
  }

  static FirestoreException mapFormatException(FormatException e) {
    if (kDebugMode) {
      print('Firestore FormatException: ${e.toString()}');
    }
    return FirestoreException(
      'Data format error: ${e.message}',
      code: 'format-error',
    );
  }

  static FirestoreException mapGenericException(Object e) {
    if (kDebugMode) {
      print('Firestore GenericException: ${e.toString()}');
    }
    if (e is FirebaseException) {
      return mapFirebaseException(e);
    }
    return FirestoreException(
      'An unexpected error occurred: ${e.toString()}',
      code: 'generic-firestore-error',
    );
  }
}
