import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function(String targetScreen) startQuiz;
  const StartScreen(this.startQuiz, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/ic_quiz.png', width: 100),
          const SizedBox(height: 20),
          Text(
            'This is a quiz app',
            style: GoogleFonts.chango(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz('questions-screen');
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Quiz !'),
          )
        ],
      ),
    );
  }
}
