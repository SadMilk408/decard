import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:english_training_app/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class AddWordDialog extends StatelessWidget {
  const AddWordDialog({
    super.key,
    required this.formKey,
    required this.mainWordController,
    required this.translateController,
    required this.dictName,
    required this.dictId,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController mainWordController;
  final TextEditingController translateController;
  final String dictName;
  final int dictId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.add_circle, color: Colors.blue),
          SizedBox(width: 8),
          Text('Добавить слово'.hardcoded),
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
                  labelText: 'Слово на английском'.hardcoded,
                  hintText: 'Введите слово'.hardcoded,
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
                    return 'Пожалуйста, введите слово'.hardcoded;
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
                  labelText: 'Перевод'.hardcoded,
                  hintText: 'Введите перевод'.hardcoded,
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
                    return 'Пожалуйста, введите перевод'.hardcoded;
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.sentences,
              ),
              SizedBox(height: 16),

              Text(
                'Добавьте новое слово в словарь "$dictName"'.hardcoded,
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
          child: Text(
            'Отмена'.hardcoded,
            style: TextStyle(color: Colors.grey[600]),
          ),
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
          child: Text('Добавить'.hardcoded),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
