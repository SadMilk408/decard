import 'package:english_training_app/features/trainings/data/repositories/word_progress_repository_impl.dart';
import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:english_training_app/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        Row(
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

        FutureBuilder(
          future: context.read<WordProgressRepository>().getTrainingStats(
            words,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: const _TrainingStatsSkeleton(),
              );
            }

            if (snapshot.hasError) {
              return SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Still learning'.hardcoded,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    '${snapshot.data?.learningCount ?? 0}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            );
          },
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

class _TrainingStatsSkeleton extends StatelessWidget {
  const _TrainingStatsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Bone.text(words: 2, fontSize: 16),
          Bone.text(words: 1, fontSize: 16, textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
