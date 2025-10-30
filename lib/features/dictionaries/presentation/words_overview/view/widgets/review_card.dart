import 'package:flutter/material.dart';
import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:english_training_app/extensions/string_extension.dart';
import 'package:english_training_app/utils/gesture_effects.dart';

import 'review_card_content.dart';

enum ReviewGrade { again, hard, good, easy }

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.word,
    this.onRevealed,
    this.dragDirection,
    this.dragProgress = 0.0,
  });

  final Word word;
  final VoidCallback? onRevealed;

  final DismissDirection? dragDirection;
  final double dragProgress;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool _infoShown = false; // показано объяснение и пример
  bool _revealed = false; // показаны переводы

  void _handleTap() {
    // логика: 1 тап → показать definition/example
    // второй тап → показать переводы
    final hasDefinition = widget.word.definition?.trim().isNotEmpty ?? false;
    final hasExample = widget.word.example?.trim().isNotEmpty ?? false;
    final hasInfo = hasDefinition || hasExample;

    if (!_infoShown && hasInfo) {
      setState(() => _infoShown = true);
      return;
    }
  }

  void _handleTapShowTranslation() {
    setState(() => _revealed = true);
    widget.onRevealed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              ReviewCardContent(
                word: widget.word,
                onTapContent: _handleTap,
                onTapShowTranslation: _handleTapShowTranslation,
                infoShown: _infoShown,
                revealed: _revealed,
              ),
              // ---------- ОВЕРЛЕИ на самой карточке ----------
              if (widget.dragDirection != null && widget.dragProgress > 0) ...[
                // Полупрозрачная вуаль, чтобы текст под ней плавно исчезал
                IgnorePointer(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 60),
                    opacity: gestureColorIntensity(widget.dragProgress),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.surface.withValues(
                          alpha: gestureColorIntensity(widget.dragProgress),
                        ),
                      ),
                    ),
                  ),
                ),
                // Рамка и подпись поверх карточки
                IgnorePointer(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 80),
                    opacity: gestureColorIntensity(widget.dragProgress),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: (widget.dragDirection ==
                                      DismissDirection.startToEnd
                                  ? Colors.green
                                  : Colors.orange)
                              .withValues(
                                alpha: gestureColorIntensity(
                                  widget.dragProgress,
                                ),
                              ),
                          width: 6,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.dragDirection == DismissDirection.startToEnd
                            ? 'Знаю'.hardcoded
                            : 'Ещё изучаю'.hardcoded,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: (widget.dragDirection ==
                                      DismissDirection.startToEnd
                                  ? Colors.green
                                  : Colors.orange)
                              .withValues(
                                alpha: gestureColorIntensity(
                                  widget.dragProgress,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
