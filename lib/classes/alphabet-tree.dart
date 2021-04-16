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
    // Ensure that [letter] only has one character and is inside `a`-`z`.
    assert(letter.length == 1);
    assert(Letters.letters.contains(letter.toLowerCase()));

    this.children = children ?? this.children;

    // Assign the new children's parent to this.
    this.children.forEach((AlphabetTree child) => child.parent = this);
  }

  /// A constructor that creates a random tree.
  AlphabetTree.random({
    required int depth,
    int maxWidth = defaultMaxWidth,
    int minWidth = 0,
  }) : this.letter = Letters.randomLetter() {
    // Only add children if more [depth] trickled down from the recursive call.
    if (depth > 1) {
      final Random random = Random();

      // Make sure that [maxWidth] is at least equal to [minWidth].
      maxWidth = max(minWidth, maxWidth);

      final int childrenCount = minWidth + random.nextInt(maxWidth - minWidth);
      for (int i = 0; i < childrenCount; i++) {
        // Pass the [depth] so child nodes can decide if they can have children.
        AlphabetTree randomTree = AlphabetTree.random(depth: depth - 1);

        randomTree.parent = this;
        children.add(randomTree);
      }
    }
  }

  /// The set of unique letters in this whole tree.
  List<String> get uniqueLetters {
    List<String> letters = [];
    letters.add(letter);
    children.forEach((AlphabetTree child) {
      letters.addAll(child.uniqueLetters);
    });

    letters = Letters.getUniqueLetters(letters);
    return letters;
  }

  /// The depth (including the root node) of this tree.
  int get depth {
    int deepestDepth = 0;
    children.forEach((AlphabetTree child) {
      deepestDepth = max(deepestDepth, child.depth);
    });

    return deepestDepth + 1;
  }

  /// The width (maximum number of nodes horizontally) of this tree.
  int get width {
    int childrenWidth = 0;
    children.forEach((AlphabetTree child) {
      childrenWidth += child.width;
    });

    return max(1, childrenWidth);
  }

  /// A printer for the unique set of letters for this tree and another.
  void compare(AlphabetTree otherTree) {
    List<String> uniqueLettersInThisTree = [];
    uniqueLetters.forEach((String letter) {
      if (!otherTree.uniqueLetters.contains(letter)) {
        uniqueLettersInThisTree.add(letter);
      }
    });

    List<String> uniqueLettersInOtherTree = [];
    otherTree.uniqueLetters.forEach((String letter) {
      if (!uniqueLetters.contains(letter)) {
        uniqueLettersInOtherTree.add(letter);
      }
    });

    print('Between the two trees being compared:');

    print('- The unique letters in this tree are:');
    print(uniqueLettersInThisTree);

    print('- The unique letters in the other tree are:');
    print(uniqueLettersInOtherTree);
  }
}
