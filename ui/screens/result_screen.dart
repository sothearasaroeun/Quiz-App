import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/app_button.dart';

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
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final q = quiz.questions[index];
                  final selectedChoice = quiz.getSelectedChoice(q.id);
                  final isCorrect = quiz.isAnswerCorrect(q.id);

                  return Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: isCorrect ? Colors.green : Colors.red,
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              q.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      ...q.choices.map((choice) {
                        final bool isSelected = selectedChoice == choice;
                        final bool isCorrectAnswer = choice == q.correctAnswer;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              if (isCorrectAnswer)
                                const Icon(Icons.check, color: Colors.green, size: 28),

                              if (isSelected && !isCorrectAnswer)
                                const Icon(Icons.close, color: Colors.red, size: 28),

                              if (!isCorrectAnswer && !(isSelected && !isCorrectAnswer))
                                const SizedBox(width: 28),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  choice,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: isSelected || isCorrectAnswer
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isCorrectAnswer
                                        ? Colors.green.shade800
                                        : isSelected && !isCorrectAnswer
                                            ? Colors.red.shade800
                                            : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            ),
          ),
      
          const SizedBox(height: 40),
          AppButton(
            text: 'Restart Quiz',
            onPressed: onBackToStart,
          ),
        ],
      ),);
  }
}