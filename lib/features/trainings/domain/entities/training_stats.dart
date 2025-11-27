class TrainingStats {
  final int learningCount; // сколько слов "в процессе" (isLearning == true)
  final int learnedCount; // сколько слов уже выучено  (isLearning == false)
  final int newCount; // сколько вообще ещё без прогресса

  TrainingStats({
    required this.learningCount,
    required this.learnedCount,
    required this.newCount,
  });
}
