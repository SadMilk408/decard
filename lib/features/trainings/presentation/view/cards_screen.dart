import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/training_progress_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CardsScreenProvider extends StatelessWidget {
  const CardsScreenProvider({super.key, required this.words});
  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingProgressBloc(),
      child: CardsScreen(words: words),
    );
  }
}

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key, required this.words});
  final List<Word> words;

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int _currentIndex = 0;
  bool _exiting = false;

  void next() {
    setState(() {
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
    next();
  }

  void onGrade(ReviewGrade g) {
    final bloc = context.read<TrainingProgressBloc>();
    switch (g) {
      case ReviewGrade.again:
        bloc.add(const TrainingProgressAgainIncremented());
        break;
      case ReviewGrade.easy:
        bloc.add(const TrainingProgressEasyIncremented());
        break;
      case ReviewGrade.hard:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ReviewGrade.good:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
    // next();
  }

  @override
  Widget build(BuildContext context) {
    if (_exiting) {
      return const Scaffold(body: SizedBox.shrink());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards ${_currentIndex + 1}/${widget.words.length}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              BlocBuilder<TrainingProgressBloc, TrainingProgressState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SideBadge(
                        text: '${state.againCount}',
                        color: Colors.orange,
                        side: BadgeSide.right,
                      ),
                      SideBadge(
                        text: '${state.easyCount}',
                        color: Colors.green,
                        side: BadgeSide.left,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CardSwiper(
                    cardsCount: widget.words.length,
                    allowedSwipeDirection: const AllowedSwipeDirection.only(
                      left: true,
                      right: true,
                    ),
                    onSwipe: (prevIndex, currentIndex, direction) {
                      if (direction == CardSwiperDirection.right) {
                        onGrade(ReviewGrade.easy);
                      } else if (direction == CardSwiperDirection.left) {
                        onGrade(ReviewGrade.again);
                      }
                      setState(() {
                        _currentIndex = (currentIndex ?? _currentIndex);
                      });
                      return true;
                    },
                    onEnd: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          Navigator.pop(context);
                        }
                      });
                    },
                    cardBuilder: (context, index, percentX, percentY) {
                      final w = widget.words[index];
                      final double pX = percentX.toDouble();
                      // percentX от CardSwiper приходит как процент (примерно -100..100)
                      final double progress =
                          (pX.abs() / 100.0).clamp(0.0, 1.0).toDouble();
                      DismissDirection? dir;
                      if (pX == 0) {
                        dir = null;
                      } else if (pX > 0) {
                        dir = DismissDirection.startToEnd;
                      } else {
                        dir = DismissDirection.endToStart;
                      }
                      return ReviewCard(
                        key: ValueKey('card-${w.id ?? w.mainWord}'),
                        word: w,
                        dragDirection: dir,
                        dragProgress: progress,
                      );
                    },
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
