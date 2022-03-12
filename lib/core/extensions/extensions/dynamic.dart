extension ToIntExt on dynamic {
  int? get asInt {
    try {
      return this as int;
    } catch (e) {
      return null;
    }
  }
}
