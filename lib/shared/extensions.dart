extension ToSafeDouble on String {
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }

  double safeToDouble() {
    if (this.isNullOrEmpty()) {
      return 0;
    } else {
      return double.tryParse(this);
    }
  }
}

extension FormatTimerTime on int {
  String formatTimer() {
    int seconds = this % 60;
    int minutes = (this - seconds) ~/ 60;
    return '${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}';
  }
}
