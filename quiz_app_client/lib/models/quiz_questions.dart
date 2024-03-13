class QuizQuestion {
  const QuizQuestion({required this.question, required this.answers});

  final String question;
  final List<dynamic> answers;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    var tmp = QuizQuestion(
      question: json['question'],
      answers: json['answers'],
    );

    return tmp;
  }
}
