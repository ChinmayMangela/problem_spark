import 'package:equatable/equatable.dart';
import 'package:problem_spark/features/auth/domain/entity/end_user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final EndUser endUser;

  const Authenticated(this.endUser);

  @override
  List<Object?> get props => [endUser];
}

class AuthError extends AuthState {
  final String errorMessage;

  const AuthError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class AuthSignedOut extends AuthState {}

class ForgotPassword extends AuthState {}

class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {
  final String successMessage;

  const ForgotPasswordSuccess(this.successMessage);

  @override
  List<Object?> get props => [successMessage];
}

class ForgotPasswordError extends AuthState {
  final String errorMessage;

  const ForgotPasswordError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
