class HangmanHelper {
  static final HangmanHelper _singleton = HangmanHelper._internal();
  factory HangmanHelper() => _singleton;
  HangmanHelper._internal();
}
