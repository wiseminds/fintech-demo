extension DurationExt on Duration {
  /// format duration to counter format
  String get toCounter =>
      RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
          .firstMatch("$this")
          ?.group(1) ??
      '00:00';
}
