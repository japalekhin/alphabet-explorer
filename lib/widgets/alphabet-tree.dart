import 'dart:math';

import 'package:alphabet_explorer/classes/AlphabetTree.dart';
import 'package:flutter/material.dart';

class AlphabetTreeWidget extends StatelessWidget {
  final AlphabetTree alphabetTree;

  const AlphabetTreeWidget({
    Key? key,
    required this.alphabetTree,
  }) : super(key: key);

  Widget buildVerticalLine(BuildContext context) {
    return SizedBox(
      width: 1,
      height: 8,
      child: Container(
        color: Colors.black,
      ),
    );
  }

  Widget buildParentLine(BuildContext context) {
    return buildVerticalLine(context);
  }

  Widget buildSelfLetter(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 36,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff000000)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(alphabetTree.letter.toUpperCase()),
        ),
      ),
    );
  }

  Widget buildChildrenLine(BuildContext context) {
    return buildVerticalLine(context);
  }

  Widget buildChildrenSiblingsLine(BuildContext context) {
    double leadingWidth = 0;
    double trailingWidth = 0;

    if (alphabetTree.children.length == 1) {
      return SizedBox(
        height: 1,
        width: 1,
        child: Container(
          color: Colors.black,
        ),
      );
    }

    if (alphabetTree.children.length > 1) {
      leadingWidth = alphabetTree.children.first.width * 48 * .5;
      trailingWidth = alphabetTree.children.last.width * 48 * .5;
    }

    return SizedBox(
      width: max(1, 48.0 * (alphabetTree.width)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: leadingWidth),
          Expanded(
            child: SizedBox(
              height: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: trailingWidth),
        ],
      ),
    );
  }

  Widget buildChildrenTree(BuildContext context) {
    List<Widget> children = [];
    alphabetTree.children.forEach((AlphabetTree childTree) {
      children.add(
        AlphabetTreeWidget(
          alphabetTree: childTree,
        ),
      );
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> treeParts = [];
    if (alphabetTree.parent != null) {
      treeParts.add(buildParentLine(context));
    }
    treeParts.add(buildSelfLetter(context));
    if (alphabetTree.children.length > 0) {
      treeParts.add(buildChildrenLine(context));
      treeParts.add(buildChildrenSiblingsLine(context));
    }
    treeParts.add(buildChildrenTree(context));

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: treeParts,
      ),
    );
  }
}
