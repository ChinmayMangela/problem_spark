import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_spark/features/auth/domain/use_case/forgot_password.dart';
import 'package:problem_spark/features/auth/presentation/bloc/auth_event.dart';
import 'package:problem_spark/features/auth/presentation/bloc/auth_state.dart';

import '../../../../common/use_case/use_case.dart';
import '../../domain/use_case/sign_in_with_email_and_password.dart';
import '../../domain/use_case/sign_out.dart';
import '../../domain/use_case/sign_up_with_email_and_password.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;
  final SignUpWithEmailAndPassword _signUpWithEmailAndPassword;
  final SignOut _signOut;
  final ForgotPasswordUseCase _forgotPassword;

  

  AuthBloc({
    required SignInWithEmailAndPassword signInWithEmailAndPassword,
    required SignUpWithEmailAndPassword signUpWithEmailAndPassword,
    required SignOut signOut,
    required ForgotPasswordUseCase forgotPassword,
  }) : _signInWithEmailAndPassword = signInWithEmailAndPassword,
       _signUpWithEmailAndPassword = signUpWithEmailAndPassword,
       _signOut = signOut,
       _forgotPassword = forgotPassword,
       super(AuthInitial()) {
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignUpRequested>(_onSignUpRequested);
    on<AuthSignOutRequested>(_onSignOutRequested);
    on<AuthForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signUpWithEmailAndPassword.call(
      SignUpParameters(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (endUser) => emit(Authenticated(endUser)),
    );
  }

  Future<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signInWithEmailAndPassword.call(
      SignInParameters(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (endUser) => emit(Authenticated(endUser)),
    );
  }

  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signOut.call(NoParams());
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthSignedOut()),
    );
  }

  Future<void> _onForgotPasswordRequested(
    AuthForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _forgotPassword.call(ForgotPasswordParameters(email: event.email));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(ForgotPasswordSuccess('Password reset email sent')),
    );
  }
}
