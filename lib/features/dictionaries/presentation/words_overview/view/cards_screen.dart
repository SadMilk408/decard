import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key, required this.words});
  final List<Word> words;

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int _currentIndex = 0;
  bool _exiting = false;

  // состояние жеста для оверлея на карточке
  DismissDirection? _dragDirection;
  double _dragProgress = 0.0; // 0..1

  void _next() {
    setState(() {
      _dragDirection = null;
      _dragProgress = 0.0;
      if (_currentIndex < widget.words.length - 1) {
        _currentIndex++;
      } else {
        _exiting = true;
      }
    });

    if (_exiting) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    }
  }

  void _onGrade(ReviewGrade g) {
    // TODO: сохранить результат (SRS/статистика)
    _next();
  }

  @override
  Widget build(BuildContext context) {
    if (_exiting) {
      return const Scaffold(body: SizedBox.shrink());
    }
    final word = widget.words[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Cards ${_currentIndex + 1}/${widget.words.length}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 0),
                  transitionBuilder:
                      (child, anim) =>
                          FadeTransition(opacity: anim, child: child),
                  child: Dismissible(
                    // ВАЖНО: ключ должен меняться на каждую новую карточку
                    key: ValueKey('dismiss-${word.id ?? word.mainWord}'),
                    direction: DismissDirection.horizontal,
                    dismissThresholds: const {
                      DismissDirection.startToEnd: 0.35,
                      DismissDirection.endToStart: 0.35,
                    },
                    background: SizedBox.shrink(),
                    secondaryBackground: SizedBox.shrink(),

                    onUpdate: (details) {
                      setState(() {
                        _dragDirection = details.direction;
                        _dragProgress = details.progress;
                      });
                    },
                    onDismissed: (dir) {
                      final grade =
                          dir == DismissDirection.startToEnd
                              ? ReviewGrade.easy
                              : ReviewGrade.again;
                      _onGrade(grade);
                    },

                    // Контент карточки
                    child: ReviewCard(
                      key: ValueKey('card-${word.id ?? word.mainWord}'),
                      word: word,
                      dragDirection: _dragDirection,
                      dragProgress: _dragProgress,
                    ),
                  ),
                ),
              ),
              // Кнопки оценок
              _GradeButtons(enabled: _dragDirection != null, onGrade: _onGrade),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradeButtons extends StatelessWidget {
  const _GradeButtons({required this.enabled, required this.onGrade});

  final bool enabled;
  final void Function(ReviewGrade) onGrade;

  @override
  Widget build(BuildContext context) {
    Widget btn(String text, ReviewGrade g, Color color) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: enabled ? color : Colors.grey[600],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: enabled ? () => onGrade(g) : null,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        btn('again', ReviewGrade.again, Colors.orange),
        btn('hard', ReviewGrade.hard, Colors.red),
        btn('good', ReviewGrade.good, Colors.blue),
        btn('easy', ReviewGrade.easy, Colors.green),
      ],
    );
  }
}
