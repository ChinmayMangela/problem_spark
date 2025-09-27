import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class AuthSignUpRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthSignUpRequested(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}

class AuthSignOutRequested extends AuthEvent {}

class AuthForgotPasswordRequested extends AuthEvent {
  final String email;

  const AuthForgotPasswordRequested(this.email);

  @override
  List<Object?> get props => [email];
}
