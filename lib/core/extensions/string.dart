extension Str on String {
  // capitalize first letter of a every word in a string
  String toTitleCase() {
    List<String> s = toLowerCase().split(' ');
    String result = '';
    if (isEmpty) return '';

    for (var e in s) {
      if (e[0].trim().isNotEmpty) {
        result += e.replaceRange(0, 1, e[0].toUpperCase());
        result += ' ';
      }
    }
    return result.trim();
  }

  String get normalizeUrl {
    return replaceAll('//', '//');
  }
}
