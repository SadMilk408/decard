import 'package:english_training_app/features/dictionaries/presentation/dictionaries_overview/view/dictionaries_page.dart';
import 'package:english_training_app/features/trainings/data/repositories/word_progress_repository_impl.dart';
import 'package:english_training_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:english_training_app/features/dictionaries/domain/repositories/repositories.dart';
import 'package:english_training_app/features/words/domain/repositories/repositories.dart';

class App extends StatelessWidget {
  const App({
    required this.createDictionaryRepository,
    required this.createWordsRepository,
    required this.createWordProgressRepository,
    super.key,
  });

  final DictRepository Function() createDictionaryRepository;
  final WordsRepository Function() createWordsRepository;
  final WordProgressRepository Function() createWordProgressRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DictRepository>(
      create: (_) => createDictionaryRepository(),
      child: RepositoryProvider<WordsRepository>(
        create: (_) => createWordsRepository(),
        child: RepositoryProvider<WordProgressRepository>(
          create: (_) => createWordProgressRepository(),
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterEngTrainTheme.light,
      darkTheme: FlutterEngTrainTheme.dark,
      home: const DictionariesOverviewScreen(),
    );
  }
}
