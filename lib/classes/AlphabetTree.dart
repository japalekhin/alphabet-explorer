class AlphabetTree {
  final String letter;
  List<AlphabetTree> children = [];

  AlphabetTree({
    required this.letter,
    List<AlphabetTree>? children,
  }) {
    this.children = children ?? this.children;
  }
}
