import 'package:flutter/material.dart';
import 'package:hangman_game/hangman.dart';
import 'package:hangman_game/playgound_provider.dart';
import 'package:provider/provider.dart';

class Playground extends StatelessWidget {
  Playground({super.key});

  final letters = 'abcdefghijklmnopqrstuvwxyz'.split('').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hangman Game",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Text(
            'Wins: ${HangmanHelper().wins}   Losses: ${HangmanHelper().losses}       ',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (context.watch<PlaygroundController>().player.chances ==
                        6)
                      Image.asset('assets/hangman_00.png'),
                    if (context.watch<PlaygroundController>().player.chances ==
                        5)
                      Image.asset('assets/hangman_01.png'),
                    if (context.watch<PlaygroundController>().player.chances ==
                        4)
                      Image.asset('assets/hangman_02.png'),
                    if (context.watch<PlaygroundController>().player.chances ==
                        3)
                      Image.asset('assets/hangman_03.png'),
                    if (context.watch<PlaygroundController>().player.chances ==
                        2)
                      Image.asset('assets/hangman_04.png'),
                    if (context.watch<PlaygroundController>().player.chances ==
                        1)
                      Image.asset('assets/hangman_05.png'),
                    if (context.watch<PlaygroundController>().player.chances ==
                        0)
                      Image.asset('assets/hangman_06.png'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                context.watch<PlaygroundController>().player.guessWord,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    context.read<PlaygroundController>().player.isFinished
                        ? _finishwidget(context)
                        : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          itemCount: letters.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<PlaygroundController>()
                                      .guessLetter(letters[index]);
                                },
                                icon: Text(
                                  letters[index].toUpperCase(),
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _finishwidget(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            context.read<PlaygroundController>().resetGame();
          },
          icon: Icon(Icons.refresh),
        ),
        Text(
          context.read<PlaygroundController>().player.guessWord ==
                  context.read<PlaygroundController>().player.word
              ? 'You Win!'
              : 'You Lose!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    ),
  );
}
