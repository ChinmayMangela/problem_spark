import 'package:flutter/material.dart';
import 'package:problem_spark/features/auth/presentation/screens/auth_screen.dart';
import 'package:problem_spark/features/splash/presentation/screens/splash_screen.dart';
import 'package:problem_spark/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MaterialApp(
      routes: _routes,
      theme: AppTheme.appTheme,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      home: SplashScreen(),
    ));
  }

  Map<String, WidgetBuilder> get _routes => {
    '/signUp': (context) => AuthScreen(),
  };
}
