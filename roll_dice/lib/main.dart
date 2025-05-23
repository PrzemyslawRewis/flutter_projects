import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          [
            Color.fromARGB(255, 53, 101, 77),
            Color.fromARGB(255, 72, 120, 96),
          ],
        ),
      ),
    ),
  );
}
