import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/common/use_case/use_case.dart';
import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/features/auth/domain/entity/end_user.dart';
import 'package:problem_spark/features/auth/domain/repository/auth_repository.dart';

class SignInWithEmailAndPassword implements UseCase<EndUser, SignInParameters> {
  final AuthRepository _authRepository;

  SignInWithEmailAndPassword(this._authRepository);

  @override
  Future<Either<Failure, EndUser>> call(SignInParameters params) async {
    return await _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParameters {
  final String email;
  final String password;

  const SignInParameters({required this.email, required this.password});
}
