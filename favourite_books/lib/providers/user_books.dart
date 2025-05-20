import 'package:favourite_books/models/book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBooksNotifier extends StateNotifier<List<Book>> {
  UserBooksNotifier() : super(const []);
  void addBook(String title, String author) {
    final newBook = Book(title: title, author: author);
    state = [newBook, ...state];
  }
}

final userBooksProvider = StateNotifierProvider<UserBooksNotifier,List<Book>>(
  (ref) => UserBooksNotifier(),
);
