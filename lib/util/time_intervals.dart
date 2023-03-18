String formatTimeChunks(int chunks) {
  if (chunks <= 0) {
    return '0min';
  }

  int hours = (chunks * 15 ~/ 60);
  int minutes = (chunks * 15) % 60;

  if (hours == 0) {
    return '$minutes min';
  } else if (minutes == 0) {
    return '$hours h';
  } else {
    return '$hours h $minutes min';
  }
}
