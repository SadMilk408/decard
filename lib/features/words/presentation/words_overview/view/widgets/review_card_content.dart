import 'package:flutter/material.dart';
import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:english_training_app/extensions/string_extension.dart';

part 'review_card_words.dart';

class ReviewCardContent extends StatelessWidget {
  const ReviewCardContent({
    super.key,
    required this.word,
    required this.onTapContent,
    required this.onTapShowTranslation,
    required this.infoShown,
    required this.revealed,
  });

  final Word word;
  final VoidCallback? onTapContent;
  final VoidCallback? onTapShowTranslation;
  final bool infoShown;
  final bool revealed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTapContent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              // Основное слово
              Text(
                word.mainWord,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: 12),

              // Основной контент с плавным переключением
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder:
                    (child, anim) =>
                        FadeTransition(opacity: anim, child: child),
                child: _ReviewCardWords(
                  word: word,
                  infoShown: infoShown,
                  revealed: revealed,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 60,
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: onTapShowTranslation,
                  child: Center(
                    child: Text(
                      'Показать перевод'.hardcoded,
                      style: textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
