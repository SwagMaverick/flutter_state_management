// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const Scaffold(
        body: Center(child: Text('Base project')),
      ),
    );
  }
}