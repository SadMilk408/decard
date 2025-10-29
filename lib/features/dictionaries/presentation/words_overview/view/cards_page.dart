import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:flutter/material.dart';

enum ReviewGrade { again, hard, good, easy }

class CardsPage extends StatelessWidget {
  const CardsPage({super.key, required this.words});

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ReviewCard(word: words[0], onGrade: (grade) {}),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.word,
    required this.onGrade,
    this.onRevealed,
  });

  final Word word;
  final void Function(ReviewGrade) onGrade;
  final VoidCallback? onRevealed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(children: [Text(word.mainWord), Text(word.translate)]),
    );
  }
}
