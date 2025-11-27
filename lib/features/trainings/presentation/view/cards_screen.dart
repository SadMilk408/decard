import 'package:english_training_app/features/trainings/data/repositories/word_progress_repository_impl.dart';
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
      create:
          (_) => TrainingProgressBloc(
            wordProgressRepository: context.read<WordProgressRepository>(),
          )..add(TrainingStarted(words: words)),
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

  void onGrade(ReviewGrade grade, int wordId) {
    final bloc = context.read<TrainingProgressBloc>();
    switch (grade) {
      case ReviewGrade.again:
        bloc.add(TrainingProgressAgainIncremented(wordId: wordId));
        break;
      case ReviewGrade.easy:
        bloc.add(TrainingProgressEasyIncremented(wordId: wordId));
        break;
      case ReviewGrade.hard:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ReviewGrade.good:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingProgressBloc, TrainingProgressState>(
      builder: (context, state) {
        return switch (state) {
          TrainingProgressFailure() => Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(child: Text(state.message)),
          ),
          TrainingProgressLoading() => Scaffold(
            appBar: AppBar(title: Text('Loading...')),
            body: const Center(child: CircularProgressIndicator()),
          ),
          TrainingProgressSuccess() => _buildSuccessState(state),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildSuccessState(TrainingProgressSuccess state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cards ${state.againCount + state.easyCount + 1}/${widget.words.length}',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Row(
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
              ),
              SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:
                      state.words.isEmpty
                          ? Center(
                            child: Column(
                              children: [
                                Text('No words to train'),
                                TextButton(
                                  onPressed: () {
                                    context.read<TrainingProgressBloc>().add(
                                      TrainingProgressReset(),
                                    );
                                  },
                                  child: Text('Reset'),
                                ),
                              ],
                            ),
                          )
                          : CardSwiper(
                            cardsCount: state.words.length,
                            numberOfCardsDisplayed:
                                state.words.length > 1 ? 2 : 1,
                            allowedSwipeDirection:
                                const AllowedSwipeDirection.only(
                                  left: true,
                                  right: true,
                                ),
                            onSwipe: (prevIndex, currentIndex, direction) {
                              if (direction == CardSwiperDirection.right) {
                                onGrade(
                                  ReviewGrade.easy,
                                  state.words[prevIndex].id,
                                );
                              } else if (direction ==
                                  CardSwiperDirection.left) {
                                onGrade(
                                  ReviewGrade.again,
                                  state.words[prevIndex].id,
                                );
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
                              final w = state.words[index];
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
                                key: ValueKey('card-${w.id}'),
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
