import 'package:flutter/material.dart';
// import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/models/quiz_questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key,
      required this.chosenAnswers,
      required this.restart,
      required this.questions})
      : super(key: key);

  final List<String> chosenAnswers;
  final void Function() restart;
  final List<QuizQuestion> questions;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summary
        .where((data) => data['correct_answer'] == data['chosen_answer'])
        .length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "You answered $numCorrectAnswers out of $numTotalQuestions correctly!",
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 32, 29, 53),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              QuestionSummary(summary: summary),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 238, 197),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: restart,
                icon: const Icon(Icons.refresh_rounded,
                    size: 30, color: Color.fromARGB(255, 32, 29, 53)),
                label: const Text(
                  'restart',
                  style: TextStyle(
                      color: Color.fromARGB(255, 32, 29, 53),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto'),
                ),
              )
            ])));
  }
}
