import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//ignore: must_be_immutable
class Questions extends StatefulWidget {
  Questions({Key? key, required this.onSelectAnswer}) : super(key: key);

  final void Function(String) onSelectAnswer;
  List<QuizQuestion> questions = [];

  List<QuizQuestion> getQuestions() => questions; // Getter method

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/questions'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      setState(() {
        widget.questions =
            json.map((item) => QuizQuestion.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  void answerQuestion(selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(context) {
    if (widget.questions.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(), // or any other loading indicator
      );
    }

    final currentQuestion = widget.questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 32, 29, 53),
              ),
            ),
            const SizedBox(height: 20),
            // ... is the spread operator,
            // it allows you to expand an iterable into a list
            ...currentQuestion.answers.map((answer) => AnswerButton(
                  answer: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
