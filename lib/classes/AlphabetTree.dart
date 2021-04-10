import 'dart:math';

import 'package:alphabet_explorer/helpers/Letters.dart';

class AlphabetTree {
  static const int defaultMaxWidth = 5;
  final String letter;
  AlphabetTree? parent;
  List<AlphabetTree> children = [];

  AlphabetTree({
    required this.letter,
    List<AlphabetTree>? children,
  }) {
    this.children = children ?? this.children;
    this.children.forEach((AlphabetTree child) => child.parent = this);
  }

  AlphabetTree.random({
    required int depth,
    int maxWidth = defaultMaxWidth,
  }) : this.letter = Letters.randomLetter() {
    if (depth > 1) {
      final Random random = Random();
      final int childrenCount = random.nextInt(maxWidth);
      for (int i = 0; i < childrenCount; i++) {
        AlphabetTree randomTree = AlphabetTree.random(depth: depth - 1);
        randomTree.parent = this;
        children.add(randomTree);
      }
    }
  }

  List<String> get uniqueLetters {
    List<String> letters = [];

    letters.add(letter);
    children.forEach((AlphabetTree child) {
      letters.addAll(child.uniqueLetters);
    });

    letters = letters.toSet().toList();
    letters.sort();

    return letters;
  }

  void compare(AlphabetTree otherTree) {
    List<String> allUniqueLetters = [
      ...uniqueLetters,
      ...otherTree.uniqueLetters,
    ].toSet().toList();

    allUniqueLetters.sort();

    print(allUniqueLetters);
  }
}
