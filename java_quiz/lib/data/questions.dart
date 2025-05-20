import 'package:java_quiz/models/quiz_question.dart';

final questions = [
  QuizQuestion(
    'What is the correct syntax for the main method in Java?',
    [
      'public static void main(String[] args)',
      'void main(String args[])',
      'static public void main()',
      'public void main(String[] args)',
    ],
  ),
  QuizQuestion(
    'Which keyword is used to inherit a class in Java?',
    [
      'extends',
      'implements',
      'inherits',
      'instanceof',
    ],
  ),
  QuizQuestion(
    'Which collection class allows you to access elements by key?',
    [
      'HashMap',
      'ArrayList',
      'LinkedList',
      'Vector',
    ],
  ),
  QuizQuestion(
    'Which of the following is not a Java keyword?',
    [
      'define',
      'final',
      'static',
      'interface',
    ],
  ),
  QuizQuestion(
    'Which Java access modifier allows visibility only within the same package?',
    [
      'default (no modifier)',
      'public',
      'protected',
      'private',
    ],
  ),
  QuizQuestion(
    'What does JVM stand for in Java?',
    [
      'Java Virtual Machine',
      'Java Verified Module',
      'Java Variable Manager',
      'Java Version Manager',
    ],
  ),
];
