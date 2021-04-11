import 'package:alphabet_explorer/helpers/letters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('`letters`', () {
    test('should have 26 items in it', () {
      expect(Letters.letters.length, 26);
    });

    test('should contain all letters', () {
      expect(Letters.letters.contains('a'), true);
      expect(Letters.letters.contains('b'), true);
      expect(Letters.letters.contains('c'), true);
      expect(Letters.letters.contains('d'), true);
      expect(Letters.letters.contains('e'), true);
      expect(Letters.letters.contains('f'), true);
      expect(Letters.letters.contains('g'), true);
      expect(Letters.letters.contains('h'), true);
      expect(Letters.letters.contains('i'), true);
      expect(Letters.letters.contains('j'), true);
      expect(Letters.letters.contains('k'), true);
      expect(Letters.letters.contains('l'), true);
      expect(Letters.letters.contains('m'), true);
      expect(Letters.letters.contains('n'), true);
      expect(Letters.letters.contains('o'), true);
      expect(Letters.letters.contains('p'), true);
      expect(Letters.letters.contains('q'), true);
      expect(Letters.letters.contains('r'), true);
      expect(Letters.letters.contains('s'), true);
      expect(Letters.letters.contains('t'), true);
      expect(Letters.letters.contains('u'), true);
      expect(Letters.letters.contains('v'), true);
      expect(Letters.letters.contains('w'), true);
      expect(Letters.letters.contains('x'), true);
      expect(Letters.letters.contains('y'), true);
      expect(Letters.letters.contains('z'), true);
    });
  });

  group('`randomLetter`', () {
    String randomLetter = Letters.randomLetter();

    test('should return only one character', () {
      expect(randomLetter.length, 1);
    });

    test('should be inside `letters`', () {
      Letters.letters.contains(randomLetter);
    });
  });

  group('`getUniqueLetters`', () {
    List<String> letters = ['z', 'x', 'a', 'a', 'a', 'a', 'x'];
    List<String> uniqueLetters = Letters.getUniqueLetters(letters);

    test('should return these letters', () {
      expect(uniqueLetters.length, 3);
      expect(uniqueLetters.contains('a'), true);
      expect(uniqueLetters.contains('x'), true);
      expect(uniqueLetters.contains('z'), true);
    });

    test('should be alphabetically arranged', () {
      expect(uniqueLetters.first, 'a');
      expect(uniqueLetters.last, 'z');
    });
  });
}
