import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/results_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // We say active screen is initially StartScreen
  // and we pass the switchScreen function to it as a variable
  // so that we could call the switchScreen function from
  // the StartScreen class
  // Widget activeScreen = StartScreen(switchScreen);
  // this way I get an error because I am using switchscreen
  // when initializing the active screen variable
  // but switchScreen is not yet defined at this point
  // to fix this we use the built in initState method
  // we initState will run only once when the class is instantiated
  // inside it we say active screes is set to StartScreen(switchScreen)
  // and we create an empty activeScreen variable
  // late means I promise it will not be null when I instantiate the class
  late Widget activeScreen;

  @override
  void initState() {
    // now when we first instantiate the class
    // the compiler first runs thru the whole class
    // so it knows what switchScreen is
    // when you first instantiate this class
    // it will run initState and set the value to
    // activeScreen
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: finishQuiz);
    });
  }

  void finishQuiz(List<Map<String, Object>> summaryData) {
    setState(() {
      activeScreen = ResultsScreen(
        summaryData: summaryData,
        onRestart: restartQuiz,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
