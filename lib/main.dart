import 'package:flutter/material.dart';

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
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
    ));
  }
}
