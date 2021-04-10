import 'package:alphabet_explorer/classes/alphabet-tree.dart';
import 'package:alphabet_explorer/widgets/alphabet-tree.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AlphabetTree tree1 = AlphabetTree(
      letter: 'a',
      children: [
        AlphabetTree(
          letter: 'l',
          children: [
            AlphabetTree(
              letter: 'k',
            ),
            AlphabetTree(
              letter: 'h',
              children: [
                AlphabetTree(
                  letter: 'i',
                ),
              ],
            ),
          ],
        ),
        AlphabetTree(
          letter: 'e',
          children: [
            AlphabetTree(
              letter: 'n',
            ),
          ],
        ),
      ],
    );
    final AlphabetTree tree2 = AlphabetTree.random(
      depth: 5,
      minWidth: 1,
      maxWidth: 3,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet Tree Explorer'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: AlphabetTreeWidget(alphabetTree: tree1),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: AlphabetTreeWidget(alphabetTree: tree2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
