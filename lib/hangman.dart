import 'dart:math';

class HangmanHelper {
  static final HangmanHelper _singleton = HangmanHelper._internal();
  factory HangmanHelper() => _singleton;
  HangmanHelper._internal();

  int wins = 0;
  int losses = 0;

  final List<String> words = [
    'hangman',
    'apple',
    'banana',
    'orange',
    'grape',
    'lemon',
    'peach',
    'cherry',
    'mango',
    'melon',
    'papaya',
    'tiger',
    'lion',
    'zebra',
    'horse',
    'monkey',
    'panda',
    'eagle',
    'shark',
    'whale',
    'snake',
    'cloud',
    'river',
    'mountain',
    'forest',
    'desert',
    'island',
    'planet',
    'ocean',
    'comet',
    'galaxy',
    'rocket',
    'happy',
    'funny',
    'angry',
    'quiet',
    'brave',
    'smart',
    'crazy',
    'sweet',
    'lucky',
    'sunny',
    'house',
    'chair',
    'table',
    'window',
    'bottle',
    'pencil',
    'school',
    'garden',
    'camera',
    'mirror',
  ];
}

class HangmanPlayer {
  bool isFinished = false;
  late String word;
  String guessWord = '';
  List<GuessLetter> guessLetters = [];
  int chances = 6;

  HangmanPlayer() {
    word =
        HangmanHelper().words[Random().nextInt(HangmanHelper().words.length)];
    guessWord = word.split('').map((_) => '_').join();
    guessLetters = word.split('').map((e) => GuessLetter(letter: e)).toList();

    print('\n------------');
    print(word);
    print(guessWord);
    print('------------\n');
  }

  void guessLetter(String letter) {
    if (isFinished) {
      return;
    }

    bool isGuessed = false;

    for (int i = 0; i < guessLetters.length; i++) {
      if (guessLetters[i].letter == letter &&
          guessLetters[i].isGuessed == false) {
        isGuessed = true;
        guessLetters[i].isGuessed = true;
        _regenerateWord();
      }
    }

    if (!isGuessed) {
      chances--;
    }

    if (word == guessWord) {
      isFinished = true;
      HangmanHelper().wins++;
      print('-------> You Win');
      // Win
    } else {
      if (chances <= 0) {
        isFinished = true;
        HangmanHelper().losses++;
        print('-------> You Lose');
        // Lose
      } else {
        print(
          '-------> Guessing Letter ($letter) - Chances ($chances) - gw ($guessWord)',
        );
        // Continue
      }
    }
  }

  void _regenerateWord() {
    String gw = '';
    for (int i = 0; i < guessLetters.length; i++) {
      gw += guessLetters[i].isGuessed ? guessLetters[i].letter : '_';
    }
    guessWord = gw;
  }
}

class GuessLetter {
  final String letter;
  bool isGuessed = false;

  GuessLetter({required this.letter, this.isGuessed = false});
}
