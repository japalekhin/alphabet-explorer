import 'package:alphabet_explorer/classes/alphabet-tree.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AlphabetTree tree = AlphabetTree(
    letter: 'j',
    children: [
      AlphabetTree(
        letter: 'a',
        children: [
          AlphabetTree(
            letter: 'a',
            children: [
              AlphabetTree(letter: 'l'),
            ],
          ),
          AlphabetTree(
            letter: 'l',
            children: [
              AlphabetTree(letter: 'l'),
              AlphabetTree(letter: 'e'),
            ],
          ),
          AlphabetTree(letter: 'e'),
        ],
      ),
      AlphabetTree(
        letter: 'p',
        children: [
          AlphabetTree(
            letter: 'k',
            children: [
              AlphabetTree(letter: 'm'),
            ],
          ),
        ],
      ),
      AlphabetTree(
        letter: 'a',
        children: [
          AlphabetTree(
            letter: 'h',
            children: [
              AlphabetTree(letter: 'o'),
            ],
          ),
          AlphabetTree(
            letter: 'i',
            children: [
              AlphabetTree(letter: 's'),
            ],
          ),
          AlphabetTree(letter: 'n'),
        ],
      ),
    ],
  );

  group('`uniqueLetters`', () {
    test('should have these unique letters', () {
      List<String> uniqueLetters = tree.uniqueLetters;
      expect(uniqueLetters.length, 12);
      expect(uniqueLetters.contains('a'), true);
      expect(uniqueLetters.contains('e'), true);
      expect(uniqueLetters.contains('h'), true);
      expect(uniqueLetters.contains('i'), true);
      expect(uniqueLetters.contains('j'), true);
      expect(uniqueLetters.contains('k'), true);
      expect(uniqueLetters.contains('l'), true);
      expect(uniqueLetters.contains('m'), true);
      expect(uniqueLetters.contains('n'), true);
      expect(uniqueLetters.contains('o'), true);
      expect(uniqueLetters.contains('p'), true);
      expect(uniqueLetters.contains('s'), true);
    });
  });

  group('`depth`', () {
    test('should be 4', () {
      expect(tree.depth, 4);
    });
  });

  group('`width`', () {
    test('should be 8', () {
      expect(tree.width, 8);
    });
  });
}
