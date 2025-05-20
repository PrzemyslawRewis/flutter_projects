import "package:flutter/material.dart";

class BasicStyledText extends StatelessWidget {
  const BasicStyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(Object context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
