

import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

abstract class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}