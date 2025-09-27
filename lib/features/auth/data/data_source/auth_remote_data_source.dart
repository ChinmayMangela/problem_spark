import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:problem_spark/features/auth/data/models/end_user_model.dart';
import 'package:problem_spark/features/auth/domain/exceptions/auth_exception.dart';
import 'package:problem_spark/features/auth/domain/exceptions/auth_exception_mapper.dart';

abstract interface class AuthRemoteDataSource {
  Future<EndUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<EndUserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> forgotPassword({required String email});

  Future<EndUserModel> get currentUser;
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<EndUserModel> get currentUser => throw UnimplementedError();

  @override
  Future<EndUserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredentials.user == null) {
        throw AuthException('user sign in failed', code: 'null-user');
      }
      await userCredentials.user!.updateDisplayName(name);
      final user = EndUserModel(
        id: userCredentials.user!.uid,
        name: name,
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<EndUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredentials.user == null) {
        throw AuthException('user sign in failed', code: 'null-user');
      }
      final user = EndUserModel(
        id: userCredentials.user!.uid,
        name: userCredentials.user!.displayName ?? '',
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionMapper.mapFirebaseAuthException(e);
    } on FormatException catch (e) {
      throw AuthExceptionMapper.mapFormatException(e);
    } on SocketException catch (e) {
      throw AuthExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw AuthExceptionMapper.mapGenericException(e);
    }
  }
}
