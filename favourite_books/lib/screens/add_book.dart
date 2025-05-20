import 'package:favourite_books/providers/user_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBookScreen extends ConsumerStatefulWidget {
  const AddBookScreen({super.key});

  @override
  ConsumerState<AddBookScreen> createState() {
    return _AddBookScreenState();
  }
}

class _AddBookScreenState extends ConsumerState<AddBookScreen> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  void _saveBook() {
    final enteredTitle = _titleController.text;
    final enteredAuthor = _authorController.text;
    if (enteredTitle.isEmpty || enteredAuthor.isEmpty) {
      return;
    }
    ref.read(userBooksProvider.notifier).addBook(enteredTitle, enteredAuthor);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new book'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: _saveBook,
                label: const Text('Add book'))
          ],
        ),
      ),
    );
  }
}
