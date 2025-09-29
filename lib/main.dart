import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_spark/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:problem_spark/features/auth/data/repository/auth_repository.dart';
import 'package:problem_spark/features/auth/domain/use_case/sign_in_with_email_and_password.dart';
import 'package:problem_spark/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:problem_spark/features/auth/presentation/screens/auth_gate.dart';
import 'package:problem_spark/features/auth/presentation/screens/auth_screen.dart';
import 'package:problem_spark/features/splash/presentation/screens/splash_screen.dart';
import 'package:problem_spark/features/user_data/data/data_source/user_data_source.dart';
import 'package:problem_spark/firebase_options.dart';
import 'package:problem_spark/home_screen.dart';
import 'package:problem_spark/theme/app_theme.dart';

import 'features/auth/domain/use_case/forgot_password.dart';
import 'features/auth/domain/use_case/sign_out.dart';
import 'features/auth/domain/use_case/sign_up_with_email_and_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  final userRemoteDataSource = UserRemoteDataSourceImpl(firebaseFirestore: FirebaseFirestore.instance);

  final authRemoteDataSource = AuthRemoteDataSourceImpl(userRemoteDataSource: userRemoteDataSource);
  final authRepository = AuthRepositoryImpl(
    authRemoteDataSource: authRemoteDataSource,
  );
  final signInWithEmailAndPassword = SignInWithEmailAndPassword(authRepository);
  final signUpWithEmailAndPassword = SignUpWithEmailAndPassword(authRepository);
  final signOut = SignOut(authRepository);
  final forgotPassword = ForgotPasswordUseCase(authRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            signInWithEmailAndPassword: signInWithEmailAndPassword,
            signUpWithEmailAndPassword: signUpWithEmailAndPassword,
            signOut: signOut,
            forgotPassword: forgotPassword,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        routes: _routes,
        theme: AppTheme.appTheme,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: messengerKey,
        home: SplashScreen(),
      ),
    );
  }

  Map<String, WidgetBuilder> get _routes => {
    '/auth': (context) => AuthScreen(),
    '/home': (context) => HomeScreen(),
    '/authGate': (context) => AuthGate(),
  };
}
