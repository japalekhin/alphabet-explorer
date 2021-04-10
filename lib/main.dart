import 'package:alphabet_explorer/alphabet-explorer.dart';
import 'package:alphabet_explorer/classes/AlphabetTree.dart';
import 'package:flutter/material.dart';

void main() {
  runConsole();
  runWithUi();
}

void runConsole() {
  print('========================================');
  AlphabetTree tree1 = AlphabetTree.random(depth: 3);
  print('tree1 contains:');
  print(tree1.uniqueLetters);
  print('');

  AlphabetTree tree2 = AlphabetTree.random(depth: 2);
  print('tree2 contains:');
  print(tree2.uniqueLetters);
  print('');

  print('both trees have:');
  tree1.compare(tree2);
  print('========================================');
}

void runWithUi() {
  runApp(AlphabetExplorer());
}
