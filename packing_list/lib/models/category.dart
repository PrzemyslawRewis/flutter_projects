import 'package:flutter/material.dart';

enum Categories {
  clothing,
  toiletries,
  electronics,
  documents,
  medicine,
  snacks,
  entertainment,
  accessories,
  sports,
  other,
}


class Category {
  const Category(this.name, this.color);
  final String name;
  final Color color;
}
