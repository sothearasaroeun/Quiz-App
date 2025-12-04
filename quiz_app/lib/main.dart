import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/question.dart';
import 'ui/screens/start_screen.dart';
import 'ui/screens/question_screen.dart';
import 'ui/screens/result_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: QuizApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _screenIndex = 0;
  int _currQuestionIndex = 0;
  late Quiz _quiz;

  @override
  void initState() {
    super.initState();
    _quiz = Quiz (questions: [
      Question(id: "1", title: "What is France?", choices: ["A Galaxcy", "A Country", "A State"], correctAnswer: "A Country"),
      Question(id: "2", title: "Who are you?", choices: ["Greek God", "Evil", "IDK"], correctAnswer: "Greek God"),
    ]);
  }

  void _startQuiz() {
    setState(() {
      _screenIndex = 1;
      _currQuestionIndex = 0;
      _quiz.answers.clear();
    });
  }

  void _answerQuestion(String choice){
    final q = _quiz.questions[_currQuestionIndex];
    _quiz.addAnswer(q.id, choice);

    setState(() {
      if (_currQuestionIndex < _quiz.questions.length - 1) {
        _currQuestionIndex++;
      } else {
        _screenIndex = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currScreen;
    
    if (_screenIndex == 0){
      currScreen = StartScreen(
        onStart: _startQuiz);
    
    } else if (_screenIndex == 1){
      final q = _quiz.questions[_currQuestionIndex];

      currScreen = QuestionScreen(
        question: q, 
        onChoiceA: () => _answerQuestion(q.choices[0]),
        onChoiceB: () => _answerQuestion(q.choices[1]),
        onChoiceC: () => _answerQuestion(q.choices[2]),
      );

    } else {
      currScreen = ResultScreen(
        quiz: _quiz, 
        onBackToStart: () {
          setState(() {
            _screenIndex = 0;
          });
        },
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: currScreen,
      ),
    );
  }
}
