import 'package:fpdart/src/either.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/common/use_case/use_case.dart';
import 'package:problem_spark/features/auth/domain/entity/end_user.dart';

import '../repository/auth_repository.dart';

class SignUpWithEmailAndPassword implements UseCase<EndUser, SignUpParameters> {
  final AuthRepository _authRepository;

  SignUpWithEmailAndPassword(this._authRepository);

  @override
  Future<Either<Failure, EndUser>> call(SignUpParameters params) async {
    return await _authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParameters {
  final String name;
  final String email;
  final String password;

  const SignUpParameters({
    required this.name,
    required this.email,
    required this.password,
  });
}
