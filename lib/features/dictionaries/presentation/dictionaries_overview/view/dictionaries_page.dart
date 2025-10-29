import 'package:english_training_app/features/dictionaries/domain/repositories/dictionary_repository.dart';
import 'package:english_training_app/features/dictionaries/presentation/dictionaries_overview/bloc/dictionary_overview_bloc.dart';
import 'package:english_training_app/features/dictionaries/presentation/words_overview/view/words_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class DictionariesOverviewPage extends StatelessWidget {
  const DictionariesOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              DictsOverviewBloc(dictRepository: context.read<DictRepository>())
                ..add(const DictsOverviewSubscriptionRequested()),
      child: const DictionariesOverview(),
    );
  }
}

class DictionariesOverview extends StatelessWidget {
  const DictionariesOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Dictionaries'),
            floating: true,
            pinned: true,
          ),

          BlocBuilder<DictsOverviewBloc, DictsOverviewState>(
            builder: (context, state) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final dictionary = state.dicts[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: DictionaryCard(
                        dictionary: dictionary,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => WordsPageProvider(
                                    dictId: dictionary.id!,
                                    dictName: dictionary.title,
                                  ),
                            ),
                          );
                        },
                        onEdit: (dictionary) async {
                          final title = await _showAddDictionaryDialog(
                            context,
                            dictionary.title,
                          );

                          if (title.isNotEmpty && context.mounted) {
                            context.read<DictsOverviewBloc>().add(
                              DictRenameRequested(
                                id: dictionary.id!,
                                newTitle: title,
                              ),
                            );
                          }
                        },
                        onDelete: (dictionary) async {
                          context.read<DictsOverviewBloc>().add(
                            DictDeleteRequested(id: dictionary.id!),
                          );
                        },
                      ),
                    );
                  }, childCount: state.dicts.length),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final title = await _showAddDictionaryDialog(context, null);

          if (title.isNotEmpty && context.mounted) {
            context.read<DictsOverviewBloc>().add(
              DictAddRequested(title: title),
            );
          }
        },
      ),
    );
  }

  Future<String> _showAddDictionaryDialog(
    BuildContext context,
    String? initialTitle,
  ) async {
    final TextEditingController controller = TextEditingController(
      text: initialTitle,
    );
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              initialTitle == null
                  ? Text('Добавить словарь')
                  : Text('Редактировать словарь'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    maxLines: 10,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Введите название',
                      hintStyle: TextStyle(color: Colors.grey[600]),
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
                        return 'Пожалуйста, введите название';
                      }
                      return null;
                    },
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  initialTitle == null
                      ? 'Создайте новый словарь для изучения'
                      : 'Редактируйте название словаря',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(''),
              child: Text('Отмена', style: TextStyle(color: Colors.grey[600])),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final title = controller.text.trim();

                  Navigator.of(context).pop(title);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(initialTitle == null ? 'Добавить' : 'Сохранить'),
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
