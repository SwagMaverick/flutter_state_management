import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final todo = context.read<TodoModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('ToDo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'New task...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      todo.addItem(value);
                      controller.clear();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: () {
                    todo.addItem(controller.text);
                    controller.clear();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TodoModel>(
              builder: (context, model, _) {
                if (model.items.isEmpty) {
                  return const Center(
                    child: Text('No tasks yet', style: TextStyle(color: Colors.grey)),
                  );
                }
                return ListView.builder(
                  itemCount: model.items.length,
                  itemBuilder: (context, index) {
                    final item = model.items[index];
                    return ListTile(
                      leading: Checkbox(
                        value: item.isDone,
                        onChanged: (_) => model.toggleItem(item.id),
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          decoration: item.isDone ? TextDecoration.lineThrough : null,
                          color: item.isDone ? Colors.grey : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => model.removeItem(item.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}