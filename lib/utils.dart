class Utils {
  static noop() {}
  static noopOneArg<T>(T obj) {}

  // Go through the list of items and pass each one to the handler
  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
