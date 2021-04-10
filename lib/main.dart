import 'package:alphabet_explorer/alphabet-explorer.dart';
import 'package:alphabet_explorer/classes/AlphabetTree.dart';
import 'package:flutter/material.dart';

void main() {
  runConsole();
  runWithUi();
}

void runConsole() {
  AlphabetTree tree1 = AlphabetTree.random(depth: 3);
  print(tree1.uniqueLetters);

  AlphabetTree tree2 = AlphabetTree.random(depth: 2);
  print(tree2.uniqueLetters);
}

void runWithUi() {
  runApp(AlphabetExplorer());
}
