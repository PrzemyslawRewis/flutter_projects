import 'package:flutter/material.dart';

import 'package:packing_list/models/category.dart';

const categories = {
  Categories.clothing: Category(
    'Clothing',
    Color.fromARGB(255, 0, 153, 255),
  ),
  Categories.toiletries: Category(
    'Toiletries',
    Color.fromARGB(255, 0, 225, 255),
  ),
  Categories.electronics: Category(
    'Electronics',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.documents: Category(
    'Documents',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.medicine: Category(
    'Medicine',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.snacks: Category(
    'Snacks',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.entertainment: Category(
    'Entertainment',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.accessories: Category(
    'Accessories',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.sports: Category(
    'Sports & Activities',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 149, 0, 255),
  ),
};
