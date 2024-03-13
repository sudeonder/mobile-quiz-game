import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          backgroundColor: const Color.fromARGB(255, 238, 238, 197),
          foregroundColor: const Color.fromARGB(255, 122, 22, 131),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
        ),
        child: Text(answer, textAlign: TextAlign.center),
      ),
    );
  }
}
