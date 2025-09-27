import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:problem_spark/features/auth/domain/entity/end_user.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  // TODO: implement currentUser
  Future<Either<Failure, EndUser>> get currentUser =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, EndUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EndUser>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authRemoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      final result = await _authRemoteDataSource.forgotPassword(email: email);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await _authRemoteDataSource.signOut();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
