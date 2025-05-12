import 'dart:math';

class HangmanHelper {
  static final HangmanHelper _singleton = HangmanHelper._internal();
  factory HangmanHelper() => _singleton;
  HangmanHelper._internal();

  int wins = 0;
  int losses = 0;

  final List<String> words = [
    'apple',
    'hangman',
    'softaware',
    'flutter',
    'google',
    'banana',
    'cherry',
    'mango',
    'orange',
    'pineapple',
    'strawberry',
    'watermelon',
    'grape',
  ];
}

class HangmanPlayer {
  bool isfinished = false;
  late String word;
  String guessesWord = '';
  List<GuessedLetter> guessedLetters = [];
  int chances = 6;

  HangmanPlayer() {
    word =
        HangmanHelper().words[Random().nextInt(HangmanHelper().words.length)];
    guessesWord = word.split('').map((_) => '_').join();
    guessedLetters =
        word.split('').map((e) => GuessedLetter(letter: e)).toList();

    print('\n----------------');
    print(word);
    print(guessesWord);
    print('----------------\n');
  }

  void guessLetter(String letter) {
    if (isfinished) return;
    bool isguessed = false;

    for (int i = 0; i < guessedLetters.length; i++) {
      if (letter == guessedLetters[i].letter &&
          guessedLetters[i].isGuessed == false) {
        guessedLetters[i].isGuessed = true;
        _regenerateGuessesWord();
      }
    }

    if (!isguessed) {
      chances--;
    }
    if (word == guessesWord) {
      //Win
      isfinished = true;
      print('------> You win!');
    }
    if (chances <= 0) {
      //Lose
      isfinished = true;
      print('------> You lose!');
    } else {
      print('------> Gusses letters: $letter');
      print('------> Gusses word: $guessesWord');
      print('------> Gusses left: $chances');
      //Continue
    }
  }

  void _regenerateGuessesWord() {
    guessesWord = '';
    for (int i = 0; i < guessedLetters.length; i++) {
      if (guessedLetters[i].isGuessed) {
        guessesWord += guessedLetters[i].letter;
      } else {
        guessesWord += '_';
      }
    }
  }
}

class GuessedLetter {
  final String letter;
  bool isGuessed = false;
  GuessedLetter({required this.letter, this.isGuessed = false});
}
