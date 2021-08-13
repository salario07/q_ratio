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
