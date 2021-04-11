import 'dart:math';

/// A class to help with letter manipulation and generation.
///
/// All members are static.
class Letters {
  /// The `List` of allowed characters to be accepted as letters.
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

  /// A random letter generator.
  static String randomLetter() {
    return letters[_random.nextInt(letters.length)];
  }

  static List<String> getUniqueLetters(List<String> letters) {
    // Convert to `Set` to eliminated duplicates then back to `List`.
    List<String> unique = letters.toSet().toList();

    unique.sort();
    return unique;
  }
}
