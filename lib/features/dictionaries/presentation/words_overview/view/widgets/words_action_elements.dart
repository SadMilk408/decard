import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:english_training_app/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class WordsActionElements extends StatelessWidget {
  const WordsActionElements({
    super.key,
    required this.words,
    required this.onCardsPressed,
  });

  final List<Word> words;
  final VoidCallback onCardsPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cards in deck'.hardcoded,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${words.length}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        FilledButton(
          onPressed: onCardsPressed,
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Cards'.hardcoded,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
