import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(height: 40),
          AppButton(
            text: 'Start Quiz',
            onPressed: onStart,
          ),
        ],
      ),
    );
  }
}