import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacklab/homepage.dart';
import 'package:stacklab/utils/auth_widget.dart';
import 'package:stacklab/dashboard.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'PressStart2P',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.red,
        backgroundColor: Colors.red,
        primaryColor: Colors.red,
      ),
      home: AuthWidget(
          signedInBuilder: (_) => Dashboard(),
          nonSignedInBuilder: (_) => MyHomePage()),
    );
  }
}
