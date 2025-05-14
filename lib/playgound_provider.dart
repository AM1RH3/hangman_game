import 'package:flutter/material.dart';
import 'package:hangman_game/hangman.dart';

class PlaygroundController extends ChangeNotifier {
  var player = HangmanPlayer();
  void guessLetter(String letter) {
    player.guessLetter(letter);

    notifyListeners();
  }

  void resetGame() {
    player = new HangmanPlayer();
    notifyListeners();
  }
}
