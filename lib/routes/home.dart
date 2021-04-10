import 'package:alphabet_explorer/classes/AlphabetTree.dart';
import 'package:alphabet_explorer/widgets/alphabet-tree.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AlphabetTree tree1 = AlphabetTree.random(
      depth: 5,
      maxWidth: 3,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet Tree Explorer'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Center(
            child: AlphabetTreeWidget(
              alphabetTree: tree1,
            ),
          ),
        ),
      ),
    );
  }
}
