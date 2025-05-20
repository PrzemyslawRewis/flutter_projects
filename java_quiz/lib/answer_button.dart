import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerContent, this.onPressed, {super.key});

  final String answerContent;
  final void Function() onPressed;

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 105),
          backgroundColor: const Color.fromARGB(255, 67, 102, 254),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          answerContent,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
