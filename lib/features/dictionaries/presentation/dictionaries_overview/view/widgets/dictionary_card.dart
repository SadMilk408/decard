import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class DictionaryCard extends StatelessWidget {
  const DictionaryCard({
    super.key,
    required this.dictionary,
    required this.onEdit,
    required this.onDelete,
    this.onTap,
  });

  final Dictionary dictionary;
  final VoidCallback? onTap;
  final Future<void> Function(Dictionary dict) onEdit;
  final Future<void> Function(Dictionary dict) onDelete;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;

    return Slidable(
      key: ValueKey('dict_${dictionary.id}'),

      // Свайп слева-направо (или наоборот — на твой вкус)
      endActionPane: ActionPane(
        motion: const DrawerMotion(), // или StretchMotion(), BehindMotion()
        extentRatio: 0.45, // ширина панели ≈ 45% ширины карточки
        children: [
          SlidableAction(
            onPressed: (_) async {
              await onEdit(dictionary);
            },
            icon: Icons.edit,
            label: 'Редактировать',
            backgroundColor: Colors.blueGrey.shade600,
            foregroundColor: Colors.white,
          ),
          SlidableAction(
            onPressed: (_) async {
              final confirmed = await _confirmDelete(context, dictionary.title);
              if (confirmed == true) {
                await onDelete(dictionary);
                // (опционально) показать Snackbar с Undo
              }
            },
            icon: Icons.delete,
            label: 'Удалить',
            backgroundColor: Colors.red.shade700,
            foregroundColor: Colors.white,
          ),
        ],
      ),

      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withValues(alpha: 0.2),
              width: 1.0,
            ),
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          title: Text(
            dictionary.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Всего слов: ${dictionary.wordsCount}',
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.grey[400],
            size: 24,
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context, String title) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Удалить словарь?'),
          content: Text('«$title» будет удалён безвозвратно. Продолжить?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена'),
            ),
            FilledButton.tonal(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Удалить'),
            ),
          ],
        );
      },
    );
  }
}
