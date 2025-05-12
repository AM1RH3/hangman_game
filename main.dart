import 'dart:math';

import 'hangman.dart';

void main() {
  final player = HangmanPlayer();
  while (!player.isfinished) {
    player.guessLetter(
      'abcdefghijklmnopqrstuvwxyz'.split('')[Random().nextInt(26)],
    );
  }
}
