import 'package:english_training_app/features/dictionaries/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class WordCardInVerticalList extends StatelessWidget {
  const WordCardInVerticalList({
    super.key,
    required this.word,
    this.onEdit,
    this.onDelete,
  });

  final Word word;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

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
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
