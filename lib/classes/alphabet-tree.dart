import 'dart:math';

import 'package:alphabet_explorer/helpers/letters.dart';

class AlphabetTree {
  static const int defaultMaxWidth = 5;
  final String letter;
  AlphabetTree? parent;
  List<AlphabetTree> children = [];

  AlphabetTree({
    required this.letter,
    List<AlphabetTree>? children,
  }) {
    assert(letter.length == 1);
    assert(Letters.letters.contains(letter.toLowerCase()));
    this.children = children ?? this.children;
    this.children.forEach((AlphabetTree child) => child.parent = this);
  }

  AlphabetTree.random({
    required int depth,
    int maxWidth = defaultMaxWidth,
    int minWidth = 0,
  }) : this.letter = Letters.randomLetter() {
    if (depth > 1) {
      final Random random = Random();
      maxWidth = max(minWidth, maxWidth);
      final int childrenCount = minWidth + random.nextInt(maxWidth - minWidth);
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

  int get depth {
    int deepestDepth = 0;
    children.forEach((AlphabetTree child) {
      deepestDepth = max(deepestDepth, child.depth);
    });
    return deepestDepth + 1;
  }

  int get width {
    int childrenWidth = 0;
    children.forEach((AlphabetTree child) {
      childrenWidth += child.width;
    });
    return max(1, childrenWidth);
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
