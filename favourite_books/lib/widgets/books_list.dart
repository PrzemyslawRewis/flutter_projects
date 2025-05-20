import 'package:favourite_books/models/book.dart';
import 'package:favourite_books/screens/book_detail.dart';
import 'package:flutter/material.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return Center(
        child: Text(
          "No books added yet",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    }
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => BooksDetailScreen(
                book: books[index],
              ),
            ),
          );
        },
        title: Text(
          books[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
