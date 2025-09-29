import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:problem_spark/features/auth/data/models/end_user_model.dart';
import 'package:problem_spark/features/user_data/domain/exceptions/firestore_exception_mapper.dart';
import 'package:problem_spark/features/user_data/domain/exceptions/firestore_exceptions.dart';

abstract interface class UserRemoteDataSource {
  Future<void> createUserProfile({required EndUserModel user});

  Future<EndUserModel> getUserProfile({required String userId});

  Future<void> updateUserProfile({required EndUserModel user});

  Future<void> deleteUserProfile({required String userId});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  final CollectionReference _userCollection;

  UserRemoteDataSourceImpl({required FirebaseFirestore firebaseFirestore})
    : _firebaseFirestore = firebaseFirestore,
      _userCollection = firebaseFirestore.collection('users');

  @override
  Future<void> createUserProfile({required EndUserModel user}) async {
    await _tryCatchWrapper(
      () => _userCollection.doc(user.id).set(user.toJson()),
    );
  }

  @override
  Future<EndUserModel> getUserProfile({required String userId}) async {
    try {
      // fetch the document of user we required using its id
      final DocumentSnapshot documentSnapshot = await _userCollection
          .doc(userId)
          .get();

      // check whether exists or not
      if (!documentSnapshot.exists) {
        throw FirestoreException(
          'User does not exists',
          code: 'user-not-found',
        );
      }

      // Cast the data to a Map<String, dynamic> and ensure it's not null.
      final Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (data == null) {
        throw FirestoreException('Data not found', code: 'data-loss');
      }

      final user = EndUserModel.fromJson(data, userId);
      return user;
    } on FirebaseException catch (e) {
      throw FirestoreExceptionMapper.mapFirebaseException(e);
    } on FormatException catch (e) {
      throw FirestoreExceptionMapper.mapFormatException(e);
    } on SocketException catch (e) {
      throw FirestoreExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw FirestoreExceptionMapper.mapGenericException(e);
    }
  }

  @override
  Future<void> updateUserProfile({required EndUserModel user}) async {
    await _tryCatchWrapper(
      () => _userCollection.doc(user.id).update(user.toJson()),
    );
  }

  @override
  Future<void> deleteUserProfile({required String userId}) async {
    await _tryCatchWrapper(() => _userCollection.doc(userId).delete());
  }

  Future<T> _tryCatchWrapper<T>(Future<T> Function() firebaseCall) async {
    try {
      return await firebaseCall();
    } on FirebaseException catch (e) {
      throw FirestoreExceptionMapper.mapFirebaseException(e);
    } on FormatException catch (e) {
      throw FirestoreExceptionMapper.mapFormatException(e);
    } on SocketException catch (e) {
      throw FirestoreExceptionMapper.mapSocketException(e);
    } catch (e) {
      throw FirestoreExceptionMapper.mapGenericException(e);
    }
  }
}
