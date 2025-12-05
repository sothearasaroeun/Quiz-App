import 'package:flutter/material.dart';
import '../../model/question.dart';
import '../widgets/app_button.dart';


class QuestionScreen extends StatelessWidget {
  final Question question;
  final VoidCallback onChoiceA;
  final VoidCallback onChoiceB;
  final VoidCallback onChoiceC;
  
  const QuestionScreen({
    super.key, 
    required this.question, 
    required this.onChoiceA,
    required this.onChoiceB,
    required this.onChoiceC,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            question.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
              textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          AppButton(text: question.choices[0], onPressed: onChoiceA),
          const SizedBox(height: 20),
          AppButton(text: question.choices[1], onPressed: onChoiceB),
          const SizedBox(height: 20),
          AppButton(text: question.choices[2], onPressed: onChoiceC),
        ],
      ),
    );
  }
}