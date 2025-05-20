import 'package:flutter/material.dart';
import 'package:java_quiz/data/questions.dart';
import 'package:java_quiz/questions_screen.dart';
import 'package:java_quiz/results_screen.dart';
import 'package:java_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];

  void switchScreen() {
    if (selectedAnswers.isNotEmpty) {
      selectedAnswers.clear();
    }
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          restartQuiz: switchScreen,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 96, 11, 244),
                Color.fromRGBO(155, 39, 176, 0.88),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
