import 'package:problem_spark/features/auth/data/models/end_user_model.dart';

abstract interface class UserRemoteDataSource {
  Future<void> createUserProfile({
    required EndUserModel user,
  });

  Future<EndUserModel> getUserProfile({
    required String userId,
  });

  Future<void> updateUserProfile({
    required EndUserModel user,
  });

  Future<void> deleteUserProfile({
    required String userId,
  });
}


