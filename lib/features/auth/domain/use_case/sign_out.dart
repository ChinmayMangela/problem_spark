

import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/common/use_case/use_case.dart';

import '../repository/auth_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  final AuthRepository _authRepository;

  SignOut(this._authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _authRepository.signOut();
  }
}