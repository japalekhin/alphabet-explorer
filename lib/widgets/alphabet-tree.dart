import 'package:alphabet_explorer/classes/AlphabetTree.dart';
import 'package:flutter/material.dart';

class AlphabetTreeWidget extends StatelessWidget {
  final AlphabetTree alphabetTree;

  const AlphabetTreeWidget({
    Key? key,
    required this.alphabetTree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    alphabetTree.children.forEach((AlphabetTree childTree) {
      children.add(
        AlphabetTreeWidget(
          alphabetTree: childTree,
        ),
      );
    });

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff000000)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(alphabetTree.letter.toUpperCase()),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ],
      ),
    );
  }
}
