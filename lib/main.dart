import 'package:blog_app_tdd/core/app.theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog TDD',
      theme: appTheme,
      home: const Center(
        child: Text('hello'),
      ),
    );
  }
}
