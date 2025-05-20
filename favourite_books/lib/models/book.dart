import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Book {
  Book({required this.title, required this.author}): id = uuid.v4();

  final String id;
  final String title;
  final String author;

}