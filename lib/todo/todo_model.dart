import 'package:flutter/foundation.dart';

class TodoItem {
  final String id;
  final String title;
  bool isDone;

  TodoItem({required this.id, required this.title, this.isDone = false});
}

class TodoModel extends ChangeNotifier {
  final List<TodoItem> _items = [];

  List<TodoItem> get items => List.unmodifiable(_items);

  void addItem(String title) {
    if (title.trim().isEmpty) return;
    _items.add(TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
    ));
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void toggleItem(String id) {
    final item = _items.firstWhere((item) => item.id == id);
    item.isDone = !item.isDone;
    notifyListeners();
  }
} 