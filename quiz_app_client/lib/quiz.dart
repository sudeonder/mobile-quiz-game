import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  var questionCount = 9;
  Questions? questionsWidget;

  void switchScreen() {
    // setState method is called to update the state of the widget
    // when called it runs the build method again
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    // questions_screen will be calling this method
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questionCount) {
      // all questions are answered
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = Questions(onSelectAnswer: chooseAnswer);
      questionsWidget = screenWidget
          as Questions; // Store a reference to the Questions widget
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restart: restartQuiz,
        questions: questionsWidget!.getQuestions(),
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 219, 192, 252),
                Color.fromARGB(255, 242, 221, 85),
                Color.fromARGB(255, 122, 22, 131)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
