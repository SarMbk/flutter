import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/question_list.dart';
import 'package:quizapp/question_text.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(List<Map<String, Object>> summaryData) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  bool answered = false;
  late List activeQuestions;
  final List<Map<String, Object>> _selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeQuestions = List.of(questionList)..shuffle();
  }

  void answerQuestion(String selectedAnswer) {
    if (answered) return;
    setState(() {
      answered = true;
    });

    final currentQuestion = activeQuestions[currentQuestionIndex];

    _selectedAnswers.add({
      'question_index': currentQuestionIndex,
      'question': currentQuestion.questionText,
      'correct_answer': currentQuestion.answers[0],
      'user_answer': selectedAnswer,
    });

    if (currentQuestionIndex < questionList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answered = false;
      });
    } else {
      widget.onSelectAnswer(_selectedAnswers);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = activeQuestions[currentQuestionIndex];
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
                    return AnswerButton(
                      answerText: answer,
                      onTap: () {
                        answerQuestion(answer);
                      },
                    );
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
