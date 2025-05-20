import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 16, color: getColorForUserAnswer(data)),
                  color: getColorForUserAnswer(data),
                ),
                child: Text(
                  ('${(data['question_index'] as int) + 1}'),
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(data['question'].toString(),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['user_answer'].toString(),
                      style: TextStyle(
                        color: getColorForUserAnswer(data),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['correct_answer'].toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 151, 232, 154),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  Color getColorForUserAnswer(Map<String, Object> data) {
    return data['user_answer'] == data['correct_answer']
        ? const Color.fromARGB(255, 151, 232, 154)
        : const Color.fromARGB(255, 228, 137, 130);
  }
}
