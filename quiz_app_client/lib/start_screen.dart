import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/ufo.png',
            width: 300,
          ),
          const SizedBox(height: 80),
          const Text("welcome to the quiz!",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 248, 248, 248),
              )),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 238, 238, 197),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto'),
            ),
            onPressed: startQuiz,
            icon: const Icon(Icons.play_arrow, size: 30),
            label: const Text('start quiz!'),
          )
        ],
      ),
    );
  }
}
