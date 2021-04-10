import 'dart:math';

import 'package:alphabet_explorer/helpers/Letters.dart';

class AlphabetTree {
  final String letter;
  List<AlphabetTree> children = [];

  AlphabetTree({
    required this.letter,
    List<AlphabetTree>? children,
  }) {
    this.children = children ?? this.children;
  }

  AlphabetTree.random({
    required int depth,
  }) : this.letter = Letters.randomLetter() {
    final Random random = Random();

    final int childrenCount = random.nextInt(5);
    for (int i = 0; i < childrenCount; i++) {
      children.add(AlphabetTree.random(depth: depth - 1));
    }
  }
}
