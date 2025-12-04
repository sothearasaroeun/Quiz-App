import 'package:flutter/material.dart';
import '../../model/quiz.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onBackToStart;

  const ResultScreen({
    super.key, 
    required this.quiz, 
    required this.onBackToStart,
  });

  @override
  Widget build(BuildContext context) {
    final correctCount = quiz.getTotalScore();
    final totalQuestions = quiz.questions.length;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "Your answerd $correctCount on $totalQuestions !",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final q = quiz.questions[index];
                  final bool correct = quiz.isAnswerCorrect(q.id);

                  return Card(
                    color: correct ? Colors.green[100] : Colors.red[100],
                    child: ListTile(
                      leading: Icon(correct ? Icons.check_circle : Icons.cancel, color: correct ? Colors.green : Colors.red),
                      title: Text(q.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        "You chose: ${quiz.getSelectedChoice(q.id) ?? "No answer"}\n"
                        "Correct answer: ${q.correctAnswer}",
                      ),
                    ),
                  );
                },
              ),
            ),
      
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: onBackToStart,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 8,
            ),
            child: const Text(
              "Restart Quiz", 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),);
  }
}