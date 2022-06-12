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


extension FormatDecimalUtils on double {
  String toOneDigitDecimal() {
    return this.toStringAsFixed(1).endsWith('0')?this.toStringAsFixed(0):this.toStringAsFixed(1);
  }
  String toNoDigitDecimal() {
    return this.toStringAsFixed(0);
  }
}