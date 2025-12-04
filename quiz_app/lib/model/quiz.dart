import 'question.dart';
import 'answer.dart';

class Quiz{
  final List<Question> questions;
  final List<Answer> answers = [];

  Quiz({required this.questions});

  void addAnswer(String questionId, String choice){
    answers.add(Answer(id: questionId, selectedChoice: choice));
  }

  int getTotalScore(){
    int score = 0;
    for (final answer in answers){
      final question = questions.firstWhere((q) => q.id == answer.id);
      if (question.isCorrect(answer.selectedChoice)){
        score += question.score;
      }
    }
    return  score;
   }

   bool isAnswerCorrect (String questionId){
    final answer = answers.firstWhere((a) => a.id == questionId, 
      orElse: () => Answer(id: "", selectedChoice: ""),
      );
      if (answer.selectedChoice.isEmpty) return false;

      final question = questions.firstWhere((q) => q.id == questionId);
      return question.isCorrect(answer.selectedChoice);
   }

   String? getSelectedChoice(String questionId){
    final answer = answers.firstWhere(
      (a) => a.id == questionId,
      orElse: () => Answer(id: "", selectedChoice: ""),
    );
    return answer.selectedChoice.isEmpty ? null : answer.selectedChoice;
   }
}