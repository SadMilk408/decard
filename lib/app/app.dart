import 'package:english_training_app/features/dictionaries/presentation/dictionaries_overview/view/dictionaries_page.dart';
import 'package:english_training_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/dictionaries/domain/repositories/repositories.dart';

class App extends StatelessWidget {
  const App({
    required this.createDictionaryRepository,
    required this.createWordsRepository,
    super.key,
  });

  final DictRepository Function() createDictionaryRepository;
  final WordsRepository Function() createWordsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DictRepository>(
      create: (_) => createDictionaryRepository(),
      child: RepositoryProvider<WordsRepository>(
        create: (_) => createWordsRepository(),
        child: const AppView(),
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
      home: const DictionariesOverviewPage(),
    );
  }
}
