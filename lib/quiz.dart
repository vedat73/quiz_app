import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  void switchScreen(String targetScreen) {
    setState(() {
      activeScreen = targetScreen; //'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    if (activeScreen == 'start-screen') {
      currentScreen = StartScreen(switchScreen);
    } else if (activeScreen == 'questions-screen') {
      selectedAnswers = [];
      currentScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      currentScreen = ResultScreen(
        chosenAnswers: selectedAnswers,
        openQuestionScreen: switchScreen,
      );
    } else {
      currentScreen = StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 238, 140, 243),
                Color.fromARGB(255, 104, 150, 241),
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
