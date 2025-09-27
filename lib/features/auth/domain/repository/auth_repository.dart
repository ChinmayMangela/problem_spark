import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/features/auth/domain/entity/end_user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, EndUser>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, EndUser>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> forgotPassword();

}
