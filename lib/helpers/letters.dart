import 'dart:math';

class Letters {
  static const List<String> letters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];
  static Random _random = Random();

  static String randomLetter() {
    return letters[_random.nextInt(letters.length)];
  }

  static List<String> getUniqueLetters(List<String> letters) {
    List<String> unique = letters.toSet().toList();
    unique.sort();
    return unique;
  }
}
