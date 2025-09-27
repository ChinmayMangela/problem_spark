import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/common/use_case/use_case.dart';
import 'package:problem_spark/features/auth/domain/repository/auth_repository.dart';

class ForgotPassword implements UseCase<void, ForgotPasswordParameters> {
  final AuthRepository _authRepository;

  ForgotPassword(this._authRepository);

  @override
  Future<Either<Failure, void>> call(ForgotPasswordParameters params) async {
    return await _authRepository.forgotPassword(email: params.email);
  }
}

class ForgotPasswordParameters {
  final String email;

  ForgotPasswordParameters({required this.email});
}
