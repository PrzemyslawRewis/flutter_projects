import 'package:favourite_books/providers/user_books.dart';
import 'package:favourite_books/screens/add_book.dart';
import 'package:favourite_books/widgets/books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksScreen extends ConsumerWidget {
  const BooksScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userBooks = ref.watch(userBooksProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your books'),
        leading: 
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const AddBookScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        
      ),
      body: BooksList(books: userBooks),
    );
  }
}
