import 'package:flutter/material.dart';

const String logoImagePath = 'assets/images/quiz-logo.png';

class StartScreen extends StatelessWidget {
  // the full syntax makes it easier to understand
  // const StartScreen(void Function() startQuiz, {super.key})
  //  : startQuiz = startQuiz;
  // This is a constructor, you construct an instance
  // of class StartScreen by passing it a pointer
  // to a void function as an argument named startQuiz
  // this argument is then saved into the instance vairable
  // (instance variable aka field)
  const StartScreen(this.startQuiz, {super.key});

  // we create a class variable. This variable stores
  // a pointer to a function. A function that returns void
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logoImagePath,
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
            // you can have a semi transparent image using the opacity widget
            // or you can use .Argb and the first number is opcaity
            // from argb is more optimal. Opacity if more performace
            // intensive
          ),
          const SizedBox(height: 32),
          const Text(
            'Learn Flutter the fun way!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            // here when we press the button we execute
            // the startQuiz function that we passed to
            // this class and saved this function as
            // a field variable
            onPressed: startQuiz,
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 78, 33, 150),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              textStyle: const TextStyle(fontSize: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
