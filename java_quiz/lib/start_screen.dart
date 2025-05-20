import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Image.asset(
              'assets/images/java_quiz.png',
              scale: 1.2,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
          Text(
            'Learn Java the fun way!',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 28),
          OutlinedButton.icon(
            style: const ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
            icon: const Icon(
              Icons.keyboard_double_arrow_right,
              color: Colors.white,
            ),
            onPressed: startQuiz,
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
