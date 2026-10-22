import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/question_list.dart';
import 'package:quizapp/question_text.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionList[Random().nextInt(questionList.length)];
    final shuffledAnswers = List.of(currentQuestion.answers)..shuffle();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionText(currentQuestion.questionText),
            const SizedBox(height: 30),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...shuffledAnswers.map((answer) {
                    return AnswerButton(answerText: answer, onTap: () {});
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
