double gestureColorIntensity(double progress, {double min = 0.65}) {
  final eased = progress * 4;
  return (min + (1.0 - min) * eased).clamp(0.0, 1.0);
}
