import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isCorrect;
  final bool isWrong;
  final bool isSelected;

  const ChoiceButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isCorrect = false,
    this.isWrong = false,
    this.isSelected = false,
    });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Color textColor = Colors.blueGrey;
    if (isCorrect && isSelected) {
      backgroundColor = Colors.green;
      textColor = Colors.green;
    } else if (isWrong && isSelected) {
      backgroundColor = Colors.red;
      textColor = Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 4,
              shadowColor: Colors.black26,
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
  }
}