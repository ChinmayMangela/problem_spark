import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/features/auth/domain/entity/end_user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, EndUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, EndUser>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> forgotPassword({required String email});

  Future<Either<Failure, EndUser>> get currentUser;

}
