import 'package:fpdart/fpdart.dart';
import 'package:problem_spark/common/failures/failure.dart';
import 'package:problem_spark/common/entity/end_user.dart';
import 'package:problem_spark/features/auth/domain/repository/auth_repository.dart';

abstract interface class CurrentUserUseCase<SuccessType> {
  Future<Either<Failure, SuccessType>> get call;
}

class CurrentUser implements CurrentUserUseCase<EndUser> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, EndUser>> get call => authRepository.currentUser;
}
