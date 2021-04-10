import 'dart:math';

import 'package:alphabet_explorer/classes/alphabet-tree.dart';
import 'package:alphabet_explorer/helpers/Letters.dart';
import 'package:alphabet_explorer/widgets/alphabet-tree.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  HomeRouteState createState() => HomeRouteState();
}

class HomeRouteState extends State<HomeRoute> {
  final Random random = Random();
  late AlphabetTree tree1;
  late AlphabetTree tree2;

  @override
  void initState() {
    tree1 = AlphabetTree(
      letter: 'a',
      children: [
        AlphabetTree(
          letter: 'l',
          children: [
            AlphabetTree(letter: 'k'),
            AlphabetTree(
              letter: 'h',
              children: [
                AlphabetTree(letter: 'i'),
              ],
            ),
          ],
        ),
        AlphabetTree(
          letter: 'e',
          children: [
            AlphabetTree(letter: 'n'),
          ],
        ),
      ],
    );

    tree2 = AlphabetTree(
      letter: 'f',
      children: [
        AlphabetTree(letter: 'l'),
        AlphabetTree(letter: 'u'),
        AlphabetTree(letter: 't'),
        AlphabetTree(
          letter: 't',
          children: [
            AlphabetTree(letter: 'e'),
            AlphabetTree(letter: 'r'),
          ],
        ),
      ],
    );

    super.initState();
  }

  Widget buildPanel(
    BuildContext context, {
    required Widget child,
    void Function()? onPressed,
  }) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: child,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                child: Text('Randomize'),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAlertBoxContent(BuildContext context, List<String> letters) {
    List<Widget> children = [];
    letters.forEach((letter) {
      children.add(Text(letter.toUpperCase()));
    });

    return SimpleDialog(
      title: Text('Unique Letters'),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      children: [
        SizedBox(height: 6),
        ...children,
        SizedBox(height: 32),
        Row(
          children: [
            Spacer(),
            ElevatedButton(
              child: Text('Okay, cool'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet Tree Explorer'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildPanel(
            context,
            child: AlphabetTreeWidget(alphabetTree: tree1),
            onPressed: onRandomize1Pressed,
          ),
          buildPanel(
            context,
            child: AlphabetTreeWidget(alphabetTree: tree2),
            onPressed: onRandomize2Pressed,
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 76,
        child: Material(
          color: Color(0xffdfe6e9),
          elevation: 30,
          child: Center(
            child: ElevatedButton(
              child: Text('Get Unique Letters'),
              onPressed: onGetUniquePressed,
            ),
          ),
        ),
      ),
    );
  }

  void onRandomize1Pressed() {
    setState(() {
      tree1 = AlphabetTree.random(depth: random.nextInt(4) + 1);
    });
  }

  void onRandomize2Pressed() {
    setState(() {
      tree2 = AlphabetTree.random(depth: random.nextInt(4) + 1);
    });
  }

  void onGetUniquePressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildAlertBoxContent(
          context,
          Letters.getUniqueLetters([
            ...tree1.uniqueLetters,
            ...tree2.uniqueLetters,
          ]),
        );
      },
    );
  }
}
