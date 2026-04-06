import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter/counter_model.dart';
import 'counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
      ],
      child: MaterialApp(
        title: 'State Management Demo',
        theme: ThemeData(colorSchemeSeed: Colors.indigo),
        home: const CounterScreen(),
      ),
    );
  }
}