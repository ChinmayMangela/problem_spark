import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/common/entity/end_user.dart';

abstract interface class UserRepository {
  Future<Either<Failure, void>> createUserProfile({required EndUser user});

  Future<Either<Failure, EndUser>> getUserProfile({required String userId});

  Future<Either<Failure, void>> updateUserProfile({required EndUser user});

  Future<Either<Failure, void>> deleteUserProfile({required String userId});
}
