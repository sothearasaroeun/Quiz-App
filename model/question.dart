class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String correctAnswer;
  final int score;

  const Question({
    required this.id, 
    required this.title, 
    required this.choices, 
    required this.correctAnswer, 
    this.score = 1,
  });

  bool isCorrect(String selectedChoice){
    return selectedChoice == correctAnswer;
  }

}