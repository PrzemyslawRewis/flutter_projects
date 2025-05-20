import "package:uuid/uuid.dart";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {exercise, learning, leisure, work}

const categoryIcons = {
  Category.exercise: Icons.sports_soccer,
  Category.learning: Icons.menu_book,
  Category.leisure: Icons.tv,
  Category.work: Icons.work,
};

class TimeLog {
  TimeLog(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class TimeLogBucket {
  const TimeLogBucket({required this.category, required this.timeLogs});
  final Category category;
  final List<TimeLog> timeLogs;

  TimeLogBucket.forCategory(List<TimeLog> allTimeLogs, this.category)
      : timeLogs = allTimeLogs
            .where((element) => element.category == category)
            .toList();

  double get totalTime {
    double sum = 0.0;
    for (final time in timeLogs) {
      sum += time.amount;
    }
    return sum;
  }
}
