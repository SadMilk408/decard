import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:english_training_app/features/dictionaries/domain/repositories/repositories.dart';
import 'package:english_training_app/features/dictionaries/presentation/words_overview/bloc/words_overview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cards_page.dart';

class WordsPageProvider extends StatelessWidget {
  const WordsPageProvider({
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
      child: WordsPage(dictName: dictName, dictId: dictId),
    );
  }
}

class WordsPage extends StatelessWidget {
  const WordsPage({super.key, required this.dictName, required this.dictId});

  final int dictId;
  final String dictName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WordsOverviewBloc, WordsOverviewState>(
        builder: (context, state) {
          final wordsCount = state.words.length;

          return CustomScrollView(
            slivers: [
              SliverAppBar(title: Text(dictName), floating: true, pinned: true),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'cards for today',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 24),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: FilledButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                CardsPage(words: state.words),
                                      ),
                                    );
                                  },
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: const Size.fromHeight(60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Study cards',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cards in deck',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$wordsCount',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                      child: WordCard(word: word),
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
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.add_circle, color: Colors.blue),
              SizedBox(width: 8),
              Text('Добавить слово'),
            ],
          ),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Основное слово
                  TextFormField(
                    controller: mainWordController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'Слово на английском',
                      hintText: 'Введите слово',
                      prefixIcon: Icon(Icons.language),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Пожалуйста, введите слово';
                      }
                      return null;
                    },
                    autofocus: true,
                    textCapitalization: TextCapitalization.none,
                  ),
                  SizedBox(height: 16),

                  // Перевод
                  TextFormField(
                    controller: translateController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'Перевод',
                      hintText: 'Введите перевод',
                      prefixIcon: Icon(Icons.translate),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Пожалуйста, введите перевод';
                      }
                      return null;
                    },
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Добавьте новое слово в словарь "$dictName"',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Отмена', style: TextStyle(color: Colors.grey[600])),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final word = Word(
                    dictionaryId: dictId,
                    mainWord: mainWordController.text.trim(),
                    translate: translateController.text.trim(),
                  );

                  Navigator.of(context).pop(word);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Добавить'),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}

class WordCard extends StatelessWidget {
  const WordCard({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Основное слово
                  Row(
                    children: [
                      Icon(Icons.language, color: Colors.blue[600], size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          word.mainWord,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Перевод
                  Row(
                    children: [
                      Icon(Icons.translate, color: Colors.green[600], size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          word.translate,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(
              onPressed: () {
                context.read<WordsOverviewBloc>().add(
                  WordsOverviewDeleteWordRequested(word: word),
                );
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
