import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter/counter_model.dart';
import 'counter/counter_screen.dart';
import 'todo/todo_model.dart';
import 'todo/todo_screen.dart';

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
        ChangeNotifierProvider(create: (_) => TodoModel()),
      ],
      child: MaterialApp(
        title: 'State Management Demo',
        theme: ThemeData(colorSchemeSeed: Colors.indigo),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final _screens = const [CounterScreen(), TodoScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: 'Counter'),
          NavigationDestination(icon: Icon(Icons.list), label: 'ToDo'),
        ],
      ),
    );
  }
}