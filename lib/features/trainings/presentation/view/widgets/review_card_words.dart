part of 'review_card_content.dart';

class _ReviewCardWords extends StatelessWidget {
  const _ReviewCardWords({
    required this.word,
    required this.infoShown,
    required this.revealed,
  });

  final Word word;
  final bool infoShown;
  final bool revealed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hasDef = word.definition?.trim().isNotEmpty ?? false;
    final hasEx = word.example?.trim().isNotEmpty ?? false;

    // 1) начальное состояние — пусто
    if (!infoShown && !revealed) {
      return const SizedBox(key: ValueKey('empty'));
    }

    // 2) показано объяснение и пример (EN)
    return Column(
      key: const ValueKey('info'),
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasDef)
          Text(
            word.definition ?? '',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
        if (hasDef) const SizedBox(height: 8),
        if (hasEx)
          Text(
            word.example ?? '',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
        if (revealed) ...[
          if (hasDef || hasEx) const SizedBox(height: 48),
          Text(
            word.translate,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.lightBlueAccent[400],
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          if (hasDef || hasEx) Divider(color: Colors.grey[300]),
          const SizedBox(height: 12),
          if (hasDef)
            Text(
              word.translationDefinition ?? '',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                color: Colors.blueGrey[300],
              ),
            ),
          if (hasDef) const SizedBox(height: 12),
          if (hasEx)
            Text(
              word.translationExample ?? '',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                color: Colors.blueGrey[300],
              ),
            ),
        ],
      ],
    );
  }
}
