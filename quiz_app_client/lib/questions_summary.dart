import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({Key? key, required this.summary}) : super(key: key);
  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // circled number icon
                Container(
                  // top left corner of container

                  margin: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    backgroundColor:
                        data['correct_answer'] == data['chosen_answer']
                            ? const Color.fromARGB(255, 172, 237, 174)
                            : Color.fromARGB(255, 232, 93, 83),
                    radius: 20,
                    child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 32, 29, 53))),
                  ),
                ),
                Expanded(
                  // expanded widget takes up the remaining space of the row
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 32, 29, 53))),
                      const SizedBox(height: 5),
                      // left align below texts

                      Text(data['correct_answer'] as String,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 85, 11, 159))),
                      Text(data['chosen_answer'] as String,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 239, 84, 84))),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
