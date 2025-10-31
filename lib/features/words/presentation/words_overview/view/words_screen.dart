import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:english_training_app/features/words/domain/repositories/repositories.dart';
import 'package:english_training_app/features/words/presentation/words_overview/bloc/words_overview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cards_screen.dart';
import 'widgets/widgets.dart';

class WordsScreenProvider extends StatelessWidget {
  const WordsScreenProvider({
    super.key,
    required this.dictName,
    required this.dictId,
  });

  final int dictId;
  final String dictName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => WordsOverviewBloc(
            wordsRepository: context.read<WordsRepository>(),
          )..add(WordsOverviewSubscriptionRequested(dictionaryId: dictId)),
      child: WordsScreen(dictName: dictName, dictId: dictId),
    );
  }
}

class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key, required this.dictName, required this.dictId});

  final int dictId;
  final String dictName;

  void _onCardsPressed(BuildContext context, List<Word> words) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardsScreen(words: words)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WordsOverviewBloc, WordsOverviewState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(title: Text(dictName), floating: true, pinned: true),
              SliverToBoxAdapter(
                child: WordsVerticalCarousel(words: state.words),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: WordsActionElements(
                    words: state.words,
                    onCardsPressed: () => _onCardsPressed(context, state.words),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final word = state.words[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: WordCardInVerticalList(word: word),
                    );
                  }, childCount: state.words.length),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final word = await _showAddWordDialog(context);

          if (word != null && context.mounted) {
            context.read<WordsOverviewBloc>().add(
              WordsOverviewAddWordRequested(word: word),
            );
          }
        },
      ),
    );
  }

  Future<Word?> _showAddWordDialog(BuildContext context) async {
    final TextEditingController mainWordController = TextEditingController();
    final TextEditingController translateController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddWordDialog(
          formKey: formKey,
          mainWordController: mainWordController,
          translateController: translateController,
          dictName: dictName,
          dictId: dictId,
        );
      },
    );
  }
}
