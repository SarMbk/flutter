import 'package:flutter/material.dart';
import 'package:quizapp/data/question_list.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.summaryData,
    required this.onRestart,
  });

  final List<Map<String, Object>> summaryData;
  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questionList.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: summaryData.map((data) {
                    final isCorrect =
                        data['user_answer'] == data['correct_answer'];
                    final questionIndex = data['question_index'] as int;

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isCorrect ? Colors.green : Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              (questionIndex + 1).toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['question'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Your answer: ${data['user_answer']}',
                                  style: TextStyle(
                                    color: isCorrect
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                  ),
                                ),
                                if (!isCorrect)
                                  Text(
                                    'Correct answer: ${data['correct_answer']}',
                                    style: const TextStyle(
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Go back to Main Page'),
            ),
          ],
        ),
      ),
    );
  }
}
